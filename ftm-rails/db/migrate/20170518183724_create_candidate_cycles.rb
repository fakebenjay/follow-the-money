class CreateCandidateCycles < ActiveRecord::Migration[5.0]
  def change
    create_table :candidate_cycles do |t|
      t.integer :candidate_id
      t.integer :cycle_id
      t.integer :amount

      t.timestamps
    end
  end
end
