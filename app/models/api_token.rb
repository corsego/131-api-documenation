class ApiToken < ApplicationRecord
  belongs_to :user
  validates :token, presence: true, uniqueness: true
  before_validation :generate_token, on: :create
  encrypts :token, deterministic: true

  private

  def generate_token
    self.token = Digest::MD5.hexdigest(SecureRandom.hex)
  end
end
