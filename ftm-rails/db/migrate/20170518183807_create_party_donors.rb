class CreatePartyDonors < ActiveRecord::Migration[5.0]
  def change
    create_table :party_donors do |t|
      t.integer :party_id
      t.integer :donor_id
      t.integer :amount

      t.timestamps
    end
  end
end
