class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :profession
      t.string :uid
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
