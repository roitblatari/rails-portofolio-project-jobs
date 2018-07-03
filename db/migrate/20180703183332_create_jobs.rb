class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :employer_id
      t.string :employee_id
      t.string :title
       t.string :address
      t.string :state
      t.datetime :date

      t.timestamps
    end
  end
end
