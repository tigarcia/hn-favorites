require 'test_helper'

class HackerNewsStoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hacker_news_story = hacker_news_stories(:one)
  end

  test "should get index" do
    get hacker_news_stories_url
    assert_response :success
  end

  test "should get new" do
    get new_hacker_news_story_url
    assert_response :success
  end

  test "should create hacker_news_story" do
    assert_difference('HackerNewsStory.count') do
      post hacker_news_stories_url, params: { hacker_news_story: { by: @hacker_news_story.by, story_id: @hacker_news_story.story_id, title: @hacker_news_story.title, url: @hacker_news_story.url } }
    end

    assert_redirected_to hacker_news_story_url(HackerNewsStory.last)
  end

  test "should show hacker_news_story" do
    get hacker_news_story_url(@hacker_news_story)
    assert_response :success
  end

  test "should get edit" do
    get edit_hacker_news_story_url(@hacker_news_story)
    assert_response :success
  end

  test "should update hacker_news_story" do
    patch hacker_news_story_url(@hacker_news_story), params: { hacker_news_story: { by: @hacker_news_story.by, story_id: @hacker_news_story.story_id, title: @hacker_news_story.title, url: @hacker_news_story.url } }
    assert_redirected_to hacker_news_story_url(@hacker_news_story)
  end

  test "should destroy hacker_news_story" do
    assert_difference('HackerNewsStory.count', -1) do
      delete hacker_news_story_url(@hacker_news_story)
    end

    assert_redirected_to hacker_news_stories_url
  end
end
