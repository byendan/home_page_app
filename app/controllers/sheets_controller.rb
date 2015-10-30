class SheetsController < ApplicationController
  before_action :logged_in_user,  only: [:create, :destroy]
  before_action :correct_user,    only: :destroy
  
  def create
    @sheet = current_user.sheets.build(sheet_params)
    if @sheet.save
      redirect_to root_url
    else
      redirect_to root_url
    end
  end
  
  
  
  private
  
    def sheet_params
      params.require(:sheet).permit(:name, :background_color, :tab_color, :tab_width, :tab_height)
    end
  
    def correct_user
      @sheet = current_user.sheets.find_by(id: params[:id])
      redirect_to root_url if @sheet.nil?
    end
  
end
