class CreateAirplanes < ActiveRecord::Migration[5.1]
  def change
    create_table :airplanes do |t|
      t.references :user, foreign_key: true
      t.references :airport, foreign_key: true
      t.references :photo, foreign_key: true
      t.string :plane_name
      t.decimal :capacity

      t.timestamps
    end
  end
end
