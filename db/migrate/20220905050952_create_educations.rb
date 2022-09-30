class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.string :first_name
      t.string :last_name
      t.string :college_name
      t.string :course
      t.string :branch
      t.references :user
      


      t.timestamps
    end
  end
end
