class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :date
      t.integer :time
      t.string :description

      t.timestamps
    end
  end
end
