class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :url
      t.text :summary
      t.datetime :publish_at
      t.integer :site_id

      t.timestamps
    end
    
    # インデックスと一意制約の追加
    add_index :feeds, :site_id
    add_index :feeds, :url, unique: true
  end
end
