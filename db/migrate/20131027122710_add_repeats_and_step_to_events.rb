class AddRepeatsAndStepToEvents < ActiveRecord::Migration
  def change
    add_column :events, :repeats, :integer
    add_column :events, :step, :integer
  end
end
