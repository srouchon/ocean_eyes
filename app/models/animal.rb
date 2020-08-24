class Animal < ApplicationRecord
  has_many :subregions, through: :habitats
  has_many :users, through: :favorites
end
