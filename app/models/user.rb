class User < ApplicationRecord
  has_secure_password

  has_many :hacker_news_stories
end
