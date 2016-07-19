class Channel < ActiveRecord::Base
  # Validations
  validates_presence_of :youtube_id
  validates_uniqueness_of :youtube_id
end
