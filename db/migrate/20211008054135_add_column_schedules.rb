class AddColumnSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :memo, :text
  end
end
