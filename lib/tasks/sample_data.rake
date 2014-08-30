namespace :db do
  desc "アプリに必要なサンプルデータを作成します"
  task sample: :environment do
    # マスタ - ユーザデータ作成（固定１ユーザ、サンプル２ユーザ）
    User.create!(email: "sample@xapp8.com",
      password: "password",
      password_confirmation: "password")
    2.times do |n|  
      email = Faker::Internet.free_email
      password  = "password"
      User.create!(email: email,
        password: password,
        password_confirmation: password)
    end

    # マスタ - 収集サイト一覧
    50.times do |n|
      title = Faker::Internet.domain_word
      url = Faker::Internet.url
      dttm = DateTime.new(rand(2013..2014), rand(1..12), rand(1..28), rand(0..23), rand(0..59), rand(0..59))
      Site.create!(title: title,
        url: url,
        date: dttm)
    end    

    # マスタ - 収集記事一覧
    500.times do |n|
      title = Faker::Lorem.sentence
      url = Faker::Internet.url
      desc = Faker::Lorem.paragraph(5)
      dttm = DateTime.new(rand(2013..2014), rand(1..12), rand(1..28), rand(0..23), rand(0..59), rand(0..59))
      site_id = rand(1..50)  # サイト数に応じて上限値を変更すること
      Feed.create!(title: title,
        url: url,
        desc: desc,
        date: dttm,
        site_id: site_id)
    end

    # トラン - ユーザ毎購読サイト一覧
    50.times do |n|         # サイト数に応じてループ回数を変更すること
      user_id = rand(1..3)  # ユーザ数に応じて上限値を変更すること
      site_id  = "#{n+1}".to_i  
      Sbsc.create!(user_id: user_id,
        site_id: site_id)
    end

    # トラン - ユーザ毎フィード一覧
    User.find_each do |user|
      Sbsc.where(:user_id => user.id).find_each do |sbsc|
        Feed.where(:site_id => sbsc.id).find_each do |feed|
          Main.create!(user_id: user.id,
            feed_id: feed.id,
            read_flg: "f",
            created_at: feed.date)
        end
      end
    end
  end
end