class CreateStateIndustries < ActiveRecord::Migration[5.0]
  def change
    create_table :state_industries do |t|
      t.integer :state_id
      t.integer :industry_id
      t.integer :amount

      t.timestamps
    end
  end
end
