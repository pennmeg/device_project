class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :client_name
      t.string :client_email
      t.string :description
      t.references :origin
      t.references :destination
      t.decimal :weight
      t.decimal :cost
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
