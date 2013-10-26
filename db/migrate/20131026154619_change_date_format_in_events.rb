class ChangeDateFormatInEvents < ActiveRecord::Migration
  def change
    change_column :events, :from, :date
    change_column :events, :to, :date
  end
end
