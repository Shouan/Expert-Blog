class AddRememberTokenToExperts < ActiveRecord::Migration
  def change
	add_column :experts, :remember_token, :string
    add_index  :experts, :remember_token
  end
end
