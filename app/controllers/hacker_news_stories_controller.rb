class HackerNewsStoriesController < ApplicationController
  before_action :set_hacker_news_story, only: [:show, :edit, :update, :destroy]

  # GET /hacker_news_stories
  # GET /hacker_news_stories.json
  def index
    @hacker_news_stories = HackerNewsStory.all
  end

  # GET /hacker_news_stories/1
  # GET /hacker_news_stories/1.json
  def show
  end

  # GET /hacker_news_stories/new
  def new
    @hacker_news_story = HackerNewsStory.new
  end

  # GET /hacker_news_stories/1/edit
  def edit
  end

  # POST /hacker_news_stories
  # POST /hacker_news_stories.json
  def create
    @hacker_news_story = HackerNewsStory.new(hacker_news_story_params)

    respond_to do |format|
      if @hacker_news_story.save
        format.html { redirect_to @hacker_news_story, notice: 'Hacker news story was successfully created.' }
        format.json { render :show, status: :created, location: @hacker_news_story }
      else
        format.html { render :new }
        format.json { render json: @hacker_news_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hacker_news_stories/1
  # PATCH/PUT /hacker_news_stories/1.json
  def update
    respond_to do |format|
      if @hacker_news_story.update(hacker_news_story_params)
        format.html { redirect_to @hacker_news_story, notice: 'Hacker news story was successfully updated.' }
        format.json { render :show, status: :ok, location: @hacker_news_story }
      else
        format.html { render :edit }
        format.json { render json: @hacker_news_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hacker_news_stories/1
  # DELETE /hacker_news_stories/1.json
  def destroy
    @hacker_news_story.destroy
    respond_to do |format|
      format.html { redirect_to hacker_news_stories_url, notice: 'Hacker news story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacker_news_story
      @hacker_news_story = HackerNewsStory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hacker_news_story_params
      params.require(:hacker_news_story).permit(:by, :story_id, :title, :url)
    end
end
