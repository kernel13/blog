class AddAthenticateToCategory < ActiveRecord::Migration
 
  def self.up
    add_column :categories, :authenticated, :boolean
  end
  
  def self.down
      remove_column :categories, :authenticated
  end

end
