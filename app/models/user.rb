class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :locations
end
