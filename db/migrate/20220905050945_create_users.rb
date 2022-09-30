class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :address
      t.string :email_id
      t.string :phone_no

      t.timestamps
    end
  end
end
