class Animal < ApplicationRecord
  has_many :subregions, through: :habitats
  has_many :users, through: :favorites

  include PgSearch::Model
  pg_search_scope :search_by_common_name_by_latin_name_and_description,
    against: [ :common_name, :latin_name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
