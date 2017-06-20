class CreateOfficialCycles < ActiveRecord::Migration[5.0]
  def change
    create_table :official_cycles do |t|
      t.integer :official_id
      t.integer :cycle_id
      t.integer :amount

      t.timestamps
    end
  end
end
