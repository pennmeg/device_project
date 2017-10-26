class CreateJobPlanes < ActiveRecord::Migration[5.1]
  def change
    create_table :job_planes do |t|
      t.references :airplane, foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
