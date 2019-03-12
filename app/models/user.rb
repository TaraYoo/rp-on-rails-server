class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :locations
  has_many :bokbulboks
end
