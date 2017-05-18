class CreateStateDonors < ActiveRecord::Migration[5.0]
  def change
    create_table :state_donors do |t|
      t.integer :state_id
      t.integer :donor_id
      t.integer :amount

      t.timestamps
    end
  end
end
