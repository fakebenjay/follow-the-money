class CreateSearch < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :input
      t.string :osid
    end
  end
end
