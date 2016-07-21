class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :channel, index: true, foreign_key: true
      t.string :youtube_video_code, null: false
      t.string :description, null: false
      t.string :title, null: false
      t.string :thumbnail_url, null: false

      t.timestamps null: false
    end
  end
end
