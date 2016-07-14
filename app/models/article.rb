class Article < ActiveRecord::Base
  # Validations
  validates_presence_of :title, :slug, :video_link, :body
  validates_uniqueness_of :title

  # Callbacks
  before_validation :add_article_slug

  def add_article_slug
    return unless self.title.present?
    self.slug = self.title.parameterize
  end

  # Paginates a list of articles
  def self.get_paginated(page, per_page)
    page = page || 1
    per_page = per_page || 7
    self.paginate(page: page, per_page: per_page)
  end
end
