class AddIndexToExpertEmail < ActiveRecord::Migration
  def change
	add_index :experts, :email_address, unique: true
  end
end
