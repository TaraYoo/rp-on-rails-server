class Location < ApplicationRecord
  belongs_to :user
  validates :name, :user, presence: true
end
