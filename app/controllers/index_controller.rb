class IndexController < ApplicationController
  def home_page
    if signed_in?
      @post = current_expert.posts.build
      @feed_items = current_expert.feed.paginate(page: params[:page])
    end
  end
  
  def about_page
  end

end
