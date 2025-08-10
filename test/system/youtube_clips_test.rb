require "application_system_test_case"

class YoutubeClipsTest < ApplicationSystemTestCase
  setup do
    @youtube_clip = youtube_clips(:one)
  end

  test "visiting the index" do
    visit youtube_clips_url
    assert_selector "h1", text: "Youtube clips"
  end

  test "should create youtube clip" do
    visit youtube_clips_url
    click_on "New youtube clip"

    fill_in "Description", with: @youtube_clip.description
    fill_in "Title", with: @youtube_clip.title
    fill_in "Video", with: @youtube_clip.video_id
    click_on "Create Youtube clip"

    assert_text "Youtube clip was successfully created"
    click_on "Back"
  end

  test "should update Youtube clip" do
    visit youtube_clip_url(@youtube_clip)
    click_on "Edit this youtube clip", match: :first

    fill_in "Description", with: @youtube_clip.description
    fill_in "Title", with: @youtube_clip.title
    fill_in "Video", with: @youtube_clip.video_id
    click_on "Update Youtube clip"

    assert_text "Youtube clip was successfully updated"
    click_on "Back"
  end

  test "should destroy Youtube clip" do
    visit youtube_clip_url(@youtube_clip)
    click_on "Destroy this youtube clip", match: :first

    assert_text "Youtube clip was successfully destroyed"
  end
end
