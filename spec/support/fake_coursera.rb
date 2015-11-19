require 'sinatra/base'

class FakeCoursera < Sinatra::Base

  get '/api/courses.v1' do
    json_response 200, 'course/all.json'
  end

  get '/api/courses.v1/:id' do
  	if params.empty?
      json_response 200, 'course/find.json'
    else
      # => startDate, :description, :instructorIds (better way to do this? seems inflexible)
      json_response 200, 'course/find_with_fields.json'
    end
  end

  private

    def json_response(response_code, file_name)
      content_type :json
      status response_code
      File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
    end
end