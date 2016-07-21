class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :video_link, null: false
      t.text   :body, null: false

      t.timestamps null: false
    end
  end
end
