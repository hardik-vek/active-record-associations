# frozen_string_literal: true
class Event < ApplicationRecord
  validates :name, :description, :event_date, presence: true
  validates :name, length: { minimum: 2, maximum: 50 }
  validates :description, length: { minimum: 10, maximum: 300 }
  belongs_to :user
  belongs_to :category
  has_many :enrollments
  has_many :enroll_events, through: :enrollments, source: :user
  has_many :comments, as: :commentable
end
