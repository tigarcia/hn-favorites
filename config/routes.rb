Rails.application.routes.draw do
  root 'hacker_news_stories#index'

  post '/login', to: 'authentication#authenticate'
  post '/signup', to: 'user#create'
  get '/stories', to: 'hacker_news_stories#index', as: 'hacker_news_stories'
  post '/stories', to: 'hacker_news_stories#create'
  get '/stories/new', to: 'hacker_news_stories#new', as: 'new_hacker_news_story'
  get '/stories/:id/edit', to: 'hacker_news_stories#edit', as: 'edit_hacker_news_story'
  get '/stories/:id', to: 'hacker_news_stories#show', as: 'hacker_news_story' 
  patch '/stories/:id', to: 'hacker_news_stories#update'
  put '/stories/:id', to: 'hacker_news_stories#update'
  delete '/stories/:id', to: 'hacker_news_stories#destroy'
end
