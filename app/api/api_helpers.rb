module ApiHelpers
    extend Grape::API::Helpers
  
    def authenticate!
      error_200! 'Authorization 缺失' if request.headers['Authorization'].blank?
      error_401! unless current_user
    end
  
    def current_user
      jwt = Sessions::TokenService.valid? request.headers['Authorization']
      return false unless jwt
      @current_user = User.find_by_id jwt['user_id']
    end
  
    def process_succeed data = nil, options = {with: nil}
      present :code, 0
      present :message, :ok
      present :data, data, options
      present :total_count, data.total_count if data.respond_to? :total_count
      status 200
    end
  
    def error_200! message, data = nil 
      error! error_msg('1', message, data), 200
    end
  
    def error_401!
      error! error_msg('1', '资源需要授权才能访问'), 401
    end
  
    def error_msg code, message, data = nil
      { code: code, message: message, data: data }
    end
  
  end