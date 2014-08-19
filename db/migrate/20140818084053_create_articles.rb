class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.text :desc
      t.string :subject
      t.string :creator
      t.datetime :date
      t.integer :page_id

      t.timestamps
    end
  end
end
