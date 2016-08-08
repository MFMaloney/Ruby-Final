class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.text :text
      t.integer :user_id
      t.attachment :image

      t.timestamps null: false
    end
  end
end
