# frozen_string_literal: true
class Event < ApplicationRecord
    validates :name, :description, :event_date, presence: true
    validates :name, length: {minimum:2,maximum:50}
    validates :description, length: {minimum:10,maximum:300}
    belongs_to :user
    # has_and_belongs_to_many :users

end

