json.array!(@mains) do |main|
  json.extract! main, :id, :user_id, :page_id, :read_flg
  json.url main_url(main, format: :json)
end
