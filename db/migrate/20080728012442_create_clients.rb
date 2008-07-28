class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name
      t.string :billing_email
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
