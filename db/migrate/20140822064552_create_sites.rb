class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title
      t.string :site_url
      t.string :rss_url
      t.datetime :last_publish_at

      t.timestamps
    end
    
    # インデックスと一意制約の追加
    add_index :sites, :rss_url, unique: true
  end
end
