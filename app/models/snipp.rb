class Snipp < ApplicationRecord
  include PgSearch
  pg_search_scope :search_snipps, against: [ :quotation, :quoter, :takeaway ],
                  using: {
                    tsearch: { prefix: true }
                  }
  belongs_to :user
  validates_presence_of :medium, :quotation, :takeaway, :quoter, :source
end
