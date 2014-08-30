class SitesController < ApplicationController
  #ログインしているかどうか確認
  before_filter :authenticate_user!

  def create
    @regSite = Site.new(addsite_params)
    # duplicate URLが重複している場合はレコードを取得。できない場合はthen以下。
    unless @dup = Site.find_by(:rssurl => "#{@regSite.rssurl}") then 
      # Feedjiraによるフィード取得処理
      feed = Feedjira::Feed.fetch_and_parse "#{@regSite.rssurl}"
      if feed == 404 then
        flash[:alert] = "エラー: #{@regSite.rssurl}のフィードが見つかりませんでした"
        redirect_to mains_path
        return
      else
        @regSite.title = feed.title
        @regSite.siteurl = feed.url
        @regSite.save!    # Sitesテーブルにレコードを登録
        @dup = Site.find_by(:rssurl => "#{@regSite.rssurl}")  #Sitesテーブルからレコードを取得
      end
    end


    # Sbscsテーブルに購読情報を登録
    @regSub = Sbsc.new
    @regSub.user_id = current_user.id
    @regSub.site_id = @dup.id
    unless @regSub.save then
      flash[:alert] = "エラー: '#{@regSub.site.title}'は既に登録されています"
    end
      
    # 元のページにリダイレクト
    redirect_to mains_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def addsite_params
      params.require(:site).permit(:rssurl)
    end  
end