require 'spec_helper'

describe Coursera::Course do

  describe '.find' do
    before do         
      @course = Coursera::Course.find "69Bku0KoEeWZtA4u62x6lQ"
    end

    it 'returns a Course' do
      expect(@course).to be_a Coursera::Course
    end

    context 'parses the correct fields' do
      data_from_json('course/find.json')['elements'][0].each do |field, value|
        it "respond to #{field}" do
          expect(@course.send field).to eq(value)
        end
      end
    end
  end
end