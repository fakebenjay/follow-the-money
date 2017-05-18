class CreatePartyIndustries < ActiveRecord::Migration[5.0]
  def change
    create_table :party_industries do |t|
      t.integer :party_id
      t.integer :industry_id
      t.integer :amount

      t.timestamps
    end
  end
end
