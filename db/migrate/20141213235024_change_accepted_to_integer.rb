class ChangeAcceptedToInteger < ActiveRecord::Migration
  def change
    change_column :volunteer_applications, :accepted, :integer, default: 0, null: false
  end
end
