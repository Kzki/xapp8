namespace :db do
  desc "登録されているSitesのフィードを取得してfeedsに格納します"
  task getfeed: :environment do

    Site.find_each do |site|
      @fjr = Feedjira::Feed.fetch_and_parse site.rss_url
      for num in 0..9 do
        @feed = @fjr.entries[num.to_i]
        unless @feed.nil? then
          @regFed = Feed.new
          @regFed.title = @feed.title
          @regFed.url = @feed.url
          @regFed.publish_at = @feed.published
          @regFed.site_id = site.id
          unless @feed.summary.nil? then
            @regFed.summary = @feed.summary
          end
          @regFed.save

        end  # unless @feed.nil? end
      end # for end
          
          Sbsc.where(:site_id => site.id).find_each do |sbsc|
            Feed.where(:site_id => site.id).find_each do |feed|
              Main.create(user_id: sbsc.user_id,
                feed_id: feed.id,
                read_flg: "f"
                )
            end
          end          
    end # site.each end

        
  end
end
