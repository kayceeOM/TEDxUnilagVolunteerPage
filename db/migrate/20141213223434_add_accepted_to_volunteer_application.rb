class AddAcceptedToVolunteerApplication < ActiveRecord::Migration
  def change
    add_column :volunteer_applications, :accepted, :boolean, :default => false
  end
end
