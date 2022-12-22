class ApplicationController < ActionController::API
    before_action :authenticate_api_key
    include Response
    include ExceptionHandler
    
    private
    def authenticate_api_key
        api_key = request.headers[:HTTP_X_API_KEY]
        if api_key.nil? or api_key != ENV['api_key'] 
            json_response(nil, :unauthorized)
        end
    end
end
