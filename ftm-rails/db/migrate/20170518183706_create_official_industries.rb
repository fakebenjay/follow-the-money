class CreateOfficialIndustries < ActiveRecord::Migration[5.0]
  def change
    create_table :official_industries do |t|
      t.integer :official_id
      t.integer :industry_id
      t.integer :amount

      t.timestamps
    end
  end
end
