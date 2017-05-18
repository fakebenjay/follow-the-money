class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.integer :state_id
      t.string :district
      t.string :office
      t.integer :party_id

      t.timestamps
    end
  end
end
