class AddPostalToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :postal, :string
  end

  def self.down
    remove_column :clients, :postal
  end
end
