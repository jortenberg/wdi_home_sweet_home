class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
    	t.string :sch_date
    	t.string :sch_time
    	t.string :st_address
    	t.string :city
    	t.string :state
    	t.integer :zip
    	
    	t.integer :user_id
    	t.belongs_to :user
    end
  end
end
