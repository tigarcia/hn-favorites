class CreateHackerNewsStories < ActiveRecord::Migration[5.0]
  def change
    create_table :hacker_news_stories do |t|
      t.string :by
      t.integer :story_id
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
