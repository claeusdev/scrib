class PagesController < ApplicationController
  def index
  	@recent_posts = Post.all.order(created_at: "DESC")
  end

  def abot
  end

  def home
  	
  end
end
