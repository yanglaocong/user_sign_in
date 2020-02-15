module Sessions
  class AuthCodeService
    attr_reader :mobile

    def initialize mobile
      @mobile = mobile
    end

    def send
      mobile_token = create_auth_code
      Rails.logger.info "向 #{mobile} 发送验证码 #{mobile_token.token}"
      :ok
    end

    private

    def create_auth_code
      token = rand 100000..999999
      AuthCode.save_token mobile, token
    end
  end
end