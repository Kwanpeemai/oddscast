class YoutubeClip < ApplicationRecord
  validates :title, presence: true
  validates :video_id, presence: true
end
