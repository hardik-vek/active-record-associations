class User < ApplicationRecord
    validates :username, uniqueness: true, presence: true, length: {minimum:2,maximum:50}
    validates :email, uniqueness: true, presence: true, length: {maximum:50}
    has_secure_password
    has_many :events, dependent: :destroy
    # has_and_belongs_to_many :events, dependent: :destroy
end
