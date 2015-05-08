class CreateBars < ActiveRecord::Migration
	def change
		create_table :bars do |t|

			t.belongs_to :crawl
			t.belongs_to :location

			t.timestamps null: false
		end
	end
end
