class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.timestamp :from
      t.timestamp :to
      t.references :calendarable, polymorphic: true

      t.timestamps
    end
  end
end
