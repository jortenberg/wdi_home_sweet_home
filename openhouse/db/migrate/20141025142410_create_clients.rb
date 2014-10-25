class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.string :fname
    	t.string :lname
    	t.string :email
    	t.string :phone
    	t.string :st_address
    	t.string :city
    	t.string :state
    	t.integer :zip
    	t.boolean :are_you

    	t.integer :house_id
    	t.belongs_to :house

    	t.timestamps
    end
  end
end
