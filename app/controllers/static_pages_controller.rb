class StaticPagesController < ApplicationController
 
  
  def home
    @page_data = page_data
    @active_sheet = active_sheet
  end

  def about
  end
  
  def sheet_change
    set_active_sheet params[:selected_value].to_i
    render :text => "success"
  end

  
end
