class Animal < ApplicationRecord
  has_many :users, through: :favorites
  has_many :habitats, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :common_name, :latin_name],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
