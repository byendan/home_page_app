class StaticPagesController < ApplicationController
 
  
  def home
    @page_data = page_data
    @active_sheet = active_sheet
  end

  def about
  end
  

  
end
