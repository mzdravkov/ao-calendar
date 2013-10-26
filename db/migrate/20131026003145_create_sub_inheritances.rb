class CreateSubInheritances < ActiveRecord::Migration
  def change
    create_table :sub_inheritances do |t|
      t.integer :group_calendar_id
      t.references :calendarable, polymorphic: true

      t.timestamps
    end
  end
end
