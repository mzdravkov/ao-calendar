class CreateSuperInheritances < ActiveRecord::Migration
  def change
    create_table :super_inheritances do |t|
      t.references :calendarable, polymorphic: true
      t.integer :super_calendar_id
      t.timestamps
    end
  end
end
