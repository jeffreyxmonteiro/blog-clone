class Snipp < ApplicationRecord
  include PgSearch
  pg_search_scope :search_snipps, against: [ :quotation, :quoter, :takeaway ],
                  associated_against: {
                    tags: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
  belongs_to :user
  validates_presence_of :medium, :quotation, :takeaway, :quoter, :source
  acts_as_taggable_on :tags
end
