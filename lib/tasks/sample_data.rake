namespace :db do
  desc "ユーザーの作成"
  task populate: :environment do
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
  
    300.times do |n|
      title = Faker::Lorem.sentence
      url = Faker::Internet.url
      desc = Faker::Lorem.paragraph(5)
      date = DateTime.new(rand(2013..2015), rand(1..12) , rand(1..30), rand(0..23), rand(0..59), rand(0..59))
      page_id = rand(1..10)
      Article.create!(title: title,
                      url: url,
                      desc: desc,
                      subject: "",
                      creator: "",
                      date: date,
                      page_id: page_id)
    end 
    
    300.times do |n|  
      user_id = rand(1..3)
      atcl_id  = "#{n+1}".to_i
      read_flg = rand(2)
      Main.create!(user_id: user_id,
                   atcl_id: atcl_id,
                   read_flg: read_flg)
    end 
  end
end