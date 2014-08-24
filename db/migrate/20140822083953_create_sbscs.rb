class CreateSbscs < ActiveRecord::Migration
  def change
    create_table :sbscs do |t|
      t.integer :user_id
      t.integer :site_id

      t.timestamps
    end
  end
end
