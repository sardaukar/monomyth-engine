module MonomythEngine
  class ApplicationController < ActionController::Base

    def fake_env format='json'
      {
        'HTTP_ACCEPT' => Rack::Mime.mime_type(".#{format.to_s}"),
        'REQUEST_METHOD' => 'GET',
        'rack.input' => {}
      }
    end

  end
end
