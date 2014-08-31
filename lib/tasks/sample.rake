namespace :db do
  desc "登録されているSitesのフィードを取得してfeedsに格納します"
  task sample2: :environment do

    # マスタ - ユーザデータ作成（固定2ユーザ）
    User.create(email: "sample@xapp8.com",
      password: "password",
      password_confirmation: "password")
    User.create(email: "sample@xapp9.com",
      password: "password",
      password_confirmation: "password")

    # マスタ - サイトおよびフィード
    urls = Array["http://new-village.hatenablog.com/rss",
      "http://zasshi.news.yahoo.co.jp/rss/newton-all.xml",
      "http://online.wsj.com/xml/rss/3_7041.xml",
      "http://military38.com/index.rdf"]
    for url in urls do
      site = Feedjira::Feed.fetch_and_parse url
      puts site.title.to_s + " " + site.url.to_s
      #Site.create(title: site.title,
      #  site_url: site.url,
      #  rss_url: url)
      for num in 0..9 do
        feed = site.entries[num.to_i]
        unless feed.nil? then
          puts num.to_s + " " + feed.title.to_s + "(" + feed.url.to_s + ")"
          puts feed.published
          unless feed.summary.nil? then
            puts feed.summary[0,20]
          end
        end
      end
    end

      
  end
end
