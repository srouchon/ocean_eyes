class Subregion < ApplicationRecord
  has_many :animals, through: :habitats
end
