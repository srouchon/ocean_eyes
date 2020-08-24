class Habitat < ApplicationRecord
  belongs_to :animal
  belongs_to :subregion
end
