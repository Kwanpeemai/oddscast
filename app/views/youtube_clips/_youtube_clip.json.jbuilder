json.extract! youtube_clip, :id, :title, :video_id, :description, :created_at, :updated_at
json.url youtube_clip_url(youtube_clip, format: :json)
