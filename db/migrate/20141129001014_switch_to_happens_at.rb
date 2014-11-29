class SwitchToHappensAt < ActiveRecord::Migration
  def change
    remove_column :events, :date
    remove_column :events, :time
    add_column :events, :happens_at, :datetime
  end
end
