class CreateDonorCycles < ActiveRecord::Migration[5.0]
  def change
    create_table :donor_cycles do |t|
      t.integer :donor_id
      t.integer :cycle_id
      t.integer :amount

      t.timestamps
    end
  end
end
