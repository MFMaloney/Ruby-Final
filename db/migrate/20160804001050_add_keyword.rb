class AddKeyword < ActiveRecord::Migration
  def change
  	add_column :ads, :keywords, :string
  end
end
