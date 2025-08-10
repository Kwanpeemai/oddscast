class CreateVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :videos do |t|
      t.string :youtube_url

      t.timestamps
    end
  end
end
