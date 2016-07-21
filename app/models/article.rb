class Article < ActiveRecord::Base
  # Relations
  belongs_to :video

  # Validations
  validates_presence_of :video, :title, :video_link, :body

  # Paginates a list of articles
  def self.get_paginated(page, per_page)
    page = page || 1
    per_page = per_page || 7
    self.paginate(page: page, per_page: per_page)
  end
end
