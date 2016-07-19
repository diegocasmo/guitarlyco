class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :youtube_id, null: false

      t.timestamps null: false
    end
  end
end
