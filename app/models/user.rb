class User < ApplicationRecord
  validates :mobile, uniqueness: true, presence: true

  enum gender: [:male, :female]

  def refresh_token
    self.token = Auth::TokenServices.issue_token user_id: self.id
    save
  end

end
