class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :url
      t.text :desc
      t.datetime :date
      t.integer :site_id

      t.timestamps
    end
  end
end
