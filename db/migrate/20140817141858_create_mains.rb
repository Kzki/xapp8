class CreateMains < ActiveRecord::Migration
  def change
    create_table :mains do |t|
      t.integer :user_id
      t.integer :atcl_id
      t.integer :read_flg

      t.timestamps
    end
  end
end
