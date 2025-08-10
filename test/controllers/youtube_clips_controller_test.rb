require "test_helper"

class YoutubeClipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @youtube_clip = youtube_clips(:one)
  end

  test "should get index" do
    get youtube_clips_url
    assert_response :success
  end

  test "should get new" do
    get new_youtube_clip_url
    assert_response :success
  end

  test "should create youtube_clip" do
    assert_difference("YoutubeClip.count") do
      post youtube_clips_url, params: { youtube_clip: { description: @youtube_clip.description, title: @youtube_clip.title, video_id: @youtube_clip.video_id } }
    end

    assert_redirected_to youtube_clip_url(YoutubeClip.last)
  end

  test "should show youtube_clip" do
    get youtube_clip_url(@youtube_clip)
    assert_response :success
  end

  test "should get edit" do
    get edit_youtube_clip_url(@youtube_clip)
    assert_response :success
  end

  test "should update youtube_clip" do
    patch youtube_clip_url(@youtube_clip), params: { youtube_clip: { description: @youtube_clip.description, title: @youtube_clip.title, video_id: @youtube_clip.video_id } }
    assert_redirected_to youtube_clip_url(@youtube_clip)
  end

  test "should destroy youtube_clip" do
    assert_difference("YoutubeClip.count", -1) do
      delete youtube_clip_url(@youtube_clip)
    end

    assert_redirected_to youtube_clips_url
  end
end
