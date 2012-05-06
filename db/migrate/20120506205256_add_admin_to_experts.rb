class AddAdminToExperts < ActiveRecord::Migration
  def change
	add_column :experts, :admin, :boolean, default: false
  end
end
