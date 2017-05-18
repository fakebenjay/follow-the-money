class CreateCandidateIndustries < ActiveRecord::Migration[5.0]
  def change
    create_table :candidate_industries do |t|
      t.integer :candidate_id
      t.integer :industry_id
      t.integer :amount

      t.timestamps
    end
  end
end
