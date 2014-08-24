namespace :samplegen do
  desc "サンプルレイク" #=> 説明

  # $ rake getfeed:exec のように使う
  # :environmentは超大事。ないとモデルにアクセスできない

  task :exec => :environment do
    feeds = Array.new
    Main.where(:user_id => 1).find_each do |usr|
      feeds << usr.feed_id
    end
    puts "ランダム抽出：#{feeds.sample}"
  end
  
  task :user_list => :environment do
    User.find_each do |usr|
      puts "ユーザID：#{usr.id}"
      Sbsc.where(:user_id => usr.id).find_each do |ssc|
        puts "サイトID：#{ssc.id}"
        Feed.where(:site_id => ssc.id).find_each do |f|
          print "#{f.id},"
        end
        puts ""
      end
    end
  end
  
end