module V1
    class Sessions < V1::Base
  
      resource :sessions do
  
        desc '获取验证码'
        params do
          requires :mobile, type: String, desc: '手机号码'
        end
        post :auth_code do
          service = ::Sessions::AuthCodeService.new params[:mobile]
          result = service.send
          process_succeed result
        end
  
        desc '用户登录'
        params do
          requires :mobile, type: String, desc: '手机号码'
          requires :auth_code, type: String, desc: '验证码'
        end
        post :sign_in do
          service = ::Sessions::SignService.new params[:mobile], params[:auth_code]
          result  = service.sign_in
          process_succeed result, with: V1::Entities::Users
        end
      end
    end

  end