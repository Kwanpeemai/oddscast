class CreateYoutubeClips < ActiveRecord::Migration[8.0]
  def change
    create_table :youtube_clips do |t|
      t.string :title
      t.string :video_id
      t.text :description

      t.timestamps
    end
  end
end
