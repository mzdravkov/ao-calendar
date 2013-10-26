class ChaneFromAndToInEventsToBeDatetimes < ActiveRecord::Migration
  def change
    change_column :events, :from, :datetime
    change_column :events, :to, :datetime
  end
end
