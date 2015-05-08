class CreateCrawls < ActiveRecord::Migration
  def change
    create_table :crawls do |t|
      t.string :name
      t.string :city
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
