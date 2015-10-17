class TabsController < ApplicationController
  before_action :logged_in_user,  only: [:create, :destroy]
  before_action :correct_user,    only: :destroy
  
  def create
    @tab = current_user.tabs.build(tab_params)
    if @tab.save
      flash[:success] = "Tab created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def destroy
    @tab.destroy
    flash[:success] = "Tab deleted"
    redirect_to root_url
  end
  
  private
  
    def tab_params
      params.require(:tab).permit(:name, :address, :picture)
    end
    
    def correct_user
      @tab = current_user.tabs.find_by(id: params[:id])
      redirect_to root_url if @tab.nil?
    end
  
end
