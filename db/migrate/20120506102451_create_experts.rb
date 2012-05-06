class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :topics_of_interest
      t.string :expertise
      t.string :professional_bio

      t.timestamps
    end
  end
end
