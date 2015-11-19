require 'sinatra/base'

class FakeCoursera < Sinatra::Base
  get '/api/courses.v1/:id' do
    json_response 200, 'course/find.json'
  end

  private

    def json_response(response_code, file_name)
      content_type :json
      status response_code
      File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
    end
end