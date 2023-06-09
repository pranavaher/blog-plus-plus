class User < ApplicationRecord
  before_save {self.email = email.downcase }
  has_many :articles, dependent: :destroy
  validates :username, presence: true, length: { minimum: 3, maximum: 30 }, uniqueness: { case_sensitive: false }
  VALID_EMAIL_EXPRESSION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 120 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_EXPRESSION }
  has_secure_password
end 