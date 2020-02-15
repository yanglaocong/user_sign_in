class AuthCode < ApplicationRecord
  validates_presence_of :mobile, :token, :expired_at

  def self.save_token mobile, token
    record = find_by_mobile mobile
    if record
      record.update_attributes mobile: mobile, token: token, expired_at: Time.now + 5.minutes
    else
      record = create mobile: mobile, token: token, expired_at: Time.now + 5.minutes
    end
    record
  end
end
