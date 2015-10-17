class TabsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def create
    @tab = current_user.tabs.build(tab_params)
    if @tab.save
      flash[:success] = "Tab created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  def destroy
    
  end
  
  private
  
    def tab_params
      params.require(:tab).permit(:name, :address)
    end
  
end
