class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title
      t.string :siteurl
      t.string :rssurl

      t.timestamps
    end
    
    # インデックスと一意制約の追加
    add_index :sites, :rssurl, unique: true
  end
end
