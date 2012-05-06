class AddPasswordDigestToExperts < ActiveRecord::Migration
  def change
	add_column :experts, :password_digest, :string
  end
end
