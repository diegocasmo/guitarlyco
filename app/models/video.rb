class Video < ActiveRecord::Base
  # Relations
  belongs_to :channel
  has_one :article

  # Validations
  validates_presence_of :channel, :youtube_video_code,
                        :description, :title, :thumbnail_url

  # Callbacks
  after_create :create_video_article

  def create_video_article
    Article.create({
      video: self,
      title: self.title,
      video_link: "https://www.youtube.com/embed/#{self.youtube_video_code}",
      body: self.description
    })
  end
end
