class Channel < ActiveRecord::Base
  # Relations
  has_many :videos

  # Validations
  validates_presence_of :youtube_channel_code
  validates_uniqueness_of :youtube_channel_code
end
