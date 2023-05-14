class User < ApplicationRecord
  has_many :transactions
  validate :unique_email
  has_secure_password
  private

  def unique_email
    existing_user = User.find_by(email: email)
    errors.add(:email, 'has already been taken') if existing_user.present?
  end

  def make_payment(email, amount)
    true unless amount > 0
    user_to_transfer = User.find_by_email(email)

  rescue
    true
  end
end