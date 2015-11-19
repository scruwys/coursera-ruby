require 'spec_helper'

describe Coursera::Base do
  
  it 'registers the base_uri' do
    expect(Coursera::Base.base_uri).to eq('https://api.coursera.org/api')
  end

  describe '#initialize' do
    before do
      @hash = { name: 'Machine Learing', slug: 'machine-learning', version: 'v2' }
      @object = Coursera::Base.new(@hash)
    end

    it 'creates instances functions based on hash keys' do
      expect(@object.name).to eq(@hash[:name])
      expect(@object.slug).to eq(@hash[:slug])
      expect(@object.version).to eq(@hash[:version])
    end
  end

  describe '.prepare_attributes' do
    before do
      @hash  = { fields: [:first, :second], includes: :other, more: 'stuff' }
      @attrs = Coursera::Base.prepare_attributes(@hash)
    end

    it 'does not change the size of the Hash' do
      expect(@attrs.size).to eq(@hash.size)
    end

    it 'concatenates array input into comma-delimited lists' do
      expect(@attrs[:fields]).to eq('first,second')
    end

    it 'does not change symbol inputs' do
      expect(@attrs[:includes]).to eq(:other)
    end

    it 'does not change string inputs' do
      expect(@attrs[:more]).to eq('stuff')
    end
  end

  describe '.batch_request' do
    before do
      @request = Coursera::Course.batch_request('/courses.v1')
    end

    it 'returns multiple Courses' do
      expect(@request.size).to be 6
      expect(@request.first).to be_a Coursera::Course
    end

    context 'parses the correct fields' do
      data_from_json('course/all.json')['elements'][0].each do |field, value|
        it "respond to #{field}" do
          expect(@request[0].send field).to eq(value)
        end
      end
    end
  end
end
