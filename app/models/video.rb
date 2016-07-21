class Video < ActiveRecord::Base
  # Relations
  belongs_to :channel
  has_many :articles

  # Validations
  validates_presence_of :channel, :youtube_video_code,
                        :description, :title, :thumbnail_url
end
