class AddUserToHackerNewsStory < ActiveRecord::Migration[5.0]
  def change
    add_reference :hacker_news_stories, :user, foreign_key: true
  end
end
