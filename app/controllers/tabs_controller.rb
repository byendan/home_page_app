class TabsController < ApplicationController
  before_action :logged_in_user,  only: [:create, :destroy]
  before_action :correct_user,    only: :destroy
  
  def create

    @tab = active_sheet.tabs.build(tab_params)
    if @tab.save
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  
  def destroy
    @tab.destroy
    redirect_to edit_user_path current_user
  end
  
  def edit
    @tab = Tab.find_by(id: params[:id])
  end
  
  def update
    @tab = Tab.find_by(id: params[:id])
    if @tab.update_attributes(tab_params)
      redirect_to edit_user_path current_user
    end
  end
  
  
  private
  
    def tab_params
      params.require(:tab).permit(:name, :address, :picture, :remote_picture_url)
    end
    
    def correct_user
      @tab = Tab.find_by(id: params[:id])
      redirect_to root_url if @tab.nil?
    end
  
end
