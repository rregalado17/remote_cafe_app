class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :job_role
      t.string :first_name
      t.string :last_name
      t.string :current_city
      t.string :original_city



      t.timestamps
    end
  end
end
