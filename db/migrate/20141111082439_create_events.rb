class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.date :date
      t.time :time
      t.string :description

      t.timestamps
    end
  end
end
