class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @tab = current_user.tabs.build if logged_in?
      @tab_feed = current_user.feed
    end
    
  end

  def about
  end
end
