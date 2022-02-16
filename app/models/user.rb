class User < ApplicationRecord
  before_save { self.email = email.downcase}
    validates :username, uniqueness: { case_sensitive: false}, presence: true, length: {minimum:2,maximum:50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, uniqueness: { case_sensitive: false}, presence: true, length: {maximum:50}, format:{ with: VALID_EMAIL_REGEX}
    has_secure_password
    has_many :events, dependent: :destroy
    # has_many :enrollment, dependent: :destroy
    # has_many :enroll_events, through: :enrollment, source: :event
    has_one :address, as: :addressable
    # has_and_belongs_to_many :events, dependent: :destroy
end
