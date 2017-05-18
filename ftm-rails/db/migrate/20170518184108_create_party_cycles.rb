class CreatePartyCycles < ActiveRecord::Migration[5.0]
  def change
    create_table :party_cycles do |t|
      t.integer :party_id
      t.integer :cycle_id
      t.integer :amount

      t.timestamps
    end
  end
end
