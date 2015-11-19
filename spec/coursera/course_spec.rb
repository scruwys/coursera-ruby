require 'spec_helper'

describe Coursera::Course do
  
  describe '.all' do
    before do
      @courses = Coursera::Course.all
    end

    it 'returns multiple Courses' do
      expect(@courses.size).to be 6
      expect(@courses.first).to be_a Coursera::Course
    end
  end

  describe '.find' do
    context 'without extra fields' do
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

    context 'with extra fields' do
      before do         
        @course = Coursera::Course.find "69Bku0KoEeWZtA4u62x6lQ", { fields: [:startDate, :description, :instructorIds] }
      end

      it 'returns a Course' do
        expect(@course).to be_a Coursera::Course
      end

      context 'parses the correct fields' do
        data_from_json('course/find_with_fields.json')['elements'][0].each do |field, value|
          it "respond to #{field}" do
            expect(@course.send field).to eq(value)
          end
        end

        it 'responds to startDate' do
          expect(@course.startDate).to eq(1447095621493)
        end
      end
    end
  end
end