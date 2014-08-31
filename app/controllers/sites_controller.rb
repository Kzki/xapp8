class SitesController < ApplicationController
  #ログインしているかどうか確認
  before_filter :authenticate_user!

  def create
    @regSite = Site.new(addsite_params)
    # duplicate URLが重複している場合はレコードを取得。できない場合はthen以下。
    unless @dup = Site.find_by(:rss_url => "#{@regSite.rss_url}") then 
      # Feedjiraによるフィード取得処理
      feed = Feedjira::Feed.fetch_and_parse "#{@regSite.rss_url}"
      if feed == 404 then
        flash[:alert] = "エラー: #{@regSite.rss_url}のフィードが見つかりませんでした"
        redirect_to mains_path
        return
      else
        @regSite.title = feed.title
        @regSite.site_url = feed.url
        @regSite.save!    # Sitesテーブルにレコードを登録
        @dup = Site.find_by(:rss_url => "#{@regSite.rss_url}")  #Sitesテーブルからレコードを取得
        
        # feedsテーブルにフィード情報を取得
        @fjr = Feedjira::Feed.fetch_and_parse @dup.rss_url
        for num in 0..9 do
          @feed = @fjr.entries[num.to_i]
          unless @feed.nil? then
            @regFed = Feed.new
            @regFed.title = @feed.title
            @regFed.url = @feed.url
            @regFed.publish_at = @feed.published
            @regFed.site_id = @dup.id
            unless @feed.summary.nil? then
              @regFed.summary = @feed.summary
            end
            @regFed.save
          end
        end

      end
    end

    # Sbscsテーブルに購読情報を登録
    @regSub = Sbsc.new
    @regSub.user_id = current_user.id
    @regSub.site_id = @dup.id
    unless @regSub.save then
      flash[:alert] = "エラー: '#{@regSub.site.title}'は既に登録されています"
    end
    
    # mainsテーブルに未読情報を登録
    Feed.where(:site_id => @dup.id).find_each do |feed|
      Main.create!(user_id: current_user.id,
        feed_id: feed.id,
        read_flg: "f",
        created_at: feed.publish_at)
    end
    
    # 元のページにリダイレクト
    redirect_to mains_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def addsite_params
      params.require(:site).permit(:rss_url)
    end  
end