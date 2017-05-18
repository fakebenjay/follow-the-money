class CreateStateCycles < ActiveRecord::Migration[5.0]
  def change
    create_table :state_cycles do |t|
      t.integer :state_id
      t.integer :cycle_id
      t.integer :amount

      t.timestamps
    end
  end
end
