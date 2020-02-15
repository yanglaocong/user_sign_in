require 'jwt'

module Sessions
  class TokenService
    class << self
      
      EXP = 2

      def issue_token data
        data['exp'] = EXP.days.from_now.to_i
        JWT.encode(data, Rails.application.secrets.secret_key_base, 'HS256')
      end

      def valid? token
        begin
          leeway = 30
          JWT.decode(token, Rails.application.secrets.secret_key_base, true, { exp_leeway: leeway, algorithm: 'HS256' }).first
        rescue
          false
        end
      end
    end
  end
end