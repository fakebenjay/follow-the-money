class CreateIndustryCycles < ActiveRecord::Migration[5.0]
  def change
    create_table :industry_cycles do |t|
      t.integer :industry_id
      t.integer :cycle_id
      t.integer :amount

      t.timestamps
    end
  end
end
