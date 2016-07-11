class Article < ActiveRecord::Base
  # Validations
  validates_presence_of :title, :video_link, :body
end
