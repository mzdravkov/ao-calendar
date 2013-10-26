class ChangeSuperInheritanceForeignKeyNames < ActiveRecord::Migration
  def change
    rename_column :super_inheritances, :super_calendar_id, :calendar_id
  end
end
