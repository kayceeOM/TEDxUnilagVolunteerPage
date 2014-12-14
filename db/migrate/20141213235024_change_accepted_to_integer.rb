class ChangeAcceptedToInteger < ActiveRecord::Migration
  def change
    remove_column :volunteer_applications, :accepted
    add_column :volunteer_applications, :accepted, :integer, default: 0, null: false
  end
end
