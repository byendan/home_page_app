class StaticPagesController < ApplicationController
  def home
    if logged_in?
      
      @page_data = Hash.new
      
      @sheets = current_user.sheets.all
      @sheet = Sheet.new
      @tab = Tab.new
      unless @sheets.empty?
      @sheets.each do |s|
        @page_data[s] = s.tabs.all
        
      end
      end
     
    end
    
  end

  def about
  end
  

  
end
