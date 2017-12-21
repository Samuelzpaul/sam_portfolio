class TopicsController < ApplicationController
  before_action :side_bar_topics
  layout 'blog'
  def index
    @topics = Topics.all
  end

  def show
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent.page(params[:page]).per(5)
    else
      @blogs = @topic.blog.published.recent.page(params[:page]).per(5)
    end
  end

  private

  def side_bar_topics
    @side_bar_topics = Topic.with_blogs
  end
end