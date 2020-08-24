class User < ApplicationRecord
  has_many :favorites
  has_many :animals, through: :favorites
end
