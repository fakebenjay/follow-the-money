class CreateOfficialDonors < ActiveRecord::Migration[5.0]
  def change
    create_table :official_donors do |t|
      t.integer :official_id
      t.integer :donor_id
      t.integer :amount

      t.timestamps
    end
  end
end
