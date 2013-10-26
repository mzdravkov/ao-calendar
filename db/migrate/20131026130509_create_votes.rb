class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :title
      t.string :effect
      t.string :subject

      t.timestamps
    end
  end
end
