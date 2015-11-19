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
end
