class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist

  def to_slug
  self.name.gsub(" ", "-").downcase
  end

end
