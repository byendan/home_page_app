class StaticPagesController < ApplicationController
 
  
  def home
    @page_data = page_data
    
  end

  def about
  end
  
  def sheet_change
    set_active_sheet params[:selected_value].to_i
    render :text => "success"
  end
  
  def get_sheet
    render :text=> "success"
    return current_sheet.id.to_i
  end
  
  def get_new_tab
    @last_tab = active_sheet.tabs.order(:created_at).last
    @tab_info = {
      name: @last_tab.name,
      address: @last_tab.address,
      picture: @last_tab.picture
    }
    render :text=> "success"
    return @tab_info.to_json
  end

  
end
