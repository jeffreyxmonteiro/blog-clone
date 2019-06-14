class Snipp < ApplicationRecord
  belongs_to :user
  validates_presence_of :medium, :quotation, :takeaway, :quoter, :source
end
