class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.time :time
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
