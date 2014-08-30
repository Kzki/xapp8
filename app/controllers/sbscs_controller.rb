class SbscsController < ApplicationController
  #ログインしているかどうか確認
  before_filter :authenticate_user!
  before_action :set_sbsc, only: [:edit, :update, :destroy]

  def index
    @sbsc = Sbsc.all
  end

  def show
  end

  def update
  end

  def new
    @sbsc = Sbsc.new
  end

  def create
    @sReg = Sbsc.new(main_params)
    @sReg.save
  end
end


private
def set_sbsc
  @sbsc = Sbsc.where(user_id => current_user.id)
end

end