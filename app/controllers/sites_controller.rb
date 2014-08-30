class SitesController < ApplicationController
  #ログインしているかどうか確認
  before_filter :authenticate_user!

  def create
    @sReg = Site.new(addsite_params)
    @sReg.save
  end
  
    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def addsite_params
      params.require(:site).permit(:url)
    end  
end