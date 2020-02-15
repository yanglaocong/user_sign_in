module Sessions
    class SignService
      include ResponseHelper
  
      attr_reader :mobile_token, :auth_token

      def initialize mobile, auth_token
        @mobile_token = AuthCode.find_by mobile: mobile
        @auth_token = auth_token
      end
  
      def sign_in
        raise '请先点击获取验证码' if mobile_token.blank?
        raise '验证码超时'        if mobile_token.expired_at < Time.now
        raise '验证码不匹配'      if mobile_token.token != auth_token
  
        user = User.find_or_create_by mobile: mobile_token.mobile
        create_token user
  
        save_and_render user
      end
  
      private
      def create_token user
        user.token = Sessions::TokenService.issue_token user_id: user.id
      end
    end
  end
  