json.extract! hacker_news_story, :id, :by, :story_id, :title, :url, :created_at, :updated_at
json.url hacker_news_story_url(hacker_news_story, format: :json)