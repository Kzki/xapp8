class CreateMains < ActiveRecord::Migration
  def change
    create_table :mains do |t|
      t.integer :user_id
      t.integer :feed_id
      t.boolean :read_flg

      t.timestamps
    end
  end
end
