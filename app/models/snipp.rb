class Snipp < ApplicationRecord
  include PgSearch
  belongs_to :user
  pg_search_scope :search_snipps, against: [ :quotation, :quoter, :takeaway ],
                  associated_against: {
                    tags: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
  validates_presence_of :medium, :quotation, :takeaway, :quoter, :source
  acts_as_taggable_on :tags

  before_save :set_tag_owner
  def set_tag_owner
      # Set the owner of some tags based on the current tag_list
      set_owner_tag_list_on(user, :tags, self.tag_list)
      # Clear the list so we don't get duplicate taggings
      self.tag_list = nil
   end

end
