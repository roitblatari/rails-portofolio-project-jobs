class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :address
      t.string :state
      t.string :uid
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
