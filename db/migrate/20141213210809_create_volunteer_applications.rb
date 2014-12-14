class CreateVolunteerApplications < ActiveRecord::Migration
  def change
    create_table :volunteer_applications do |t|

      t.string :name
      t.string :email
      t.string :course
      t.integer :year
      t.string :interest
      t.string :reason

      t.timestamps
    end
  end
end
