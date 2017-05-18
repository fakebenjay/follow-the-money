class CreateCandidateDonors < ActiveRecord::Migration[5.0]
  def change
    create_table :candidate_donors do |t|
      t.integer :candidate_id
      t.integer :donor_id
      t.integer :amount

      t.timestamps
    end
  end
end
