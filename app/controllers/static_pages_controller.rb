class StaticPagesController < ApplicationController
  def home
    #ログイン状態でhomeにアクセスした場合
    if user_signed_in?
      redirect_to mains_path
    end
  end

  def help
  end

end
