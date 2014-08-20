namespace :getfeed do
  desc "登録されているページのフィードをDBに格納します" #=> 説明

  # $ rake getfeed:exec のように使う
  # :environmentは超大事。ないとモデルにアクセスできない

  task :exec => :environment do 
    urls = %w[http://new-village.hatenablog.com/rss]
    feeds = Feedjira::Feed.fetch_and_parse urls
    feed = feeds['http://new-village.hatenablog.com/rss']
    puts "ブログTTL："+feed.title
    puts "ブログURL："+feed.url
    feed.entries
    entry = feed.entries.first
    puts "記事　TTL："+entry.title
    puts "記事　URL："+entry.url 
  end

end
