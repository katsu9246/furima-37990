class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,null: false
      t.text :explanation,null: false
      t.string :price,null: false
      t.references :user,null: false, foreign_key: true
      t.integer :category_id, null: false
      t.integer :situation_id, null: false
      t.integer :delivery_charge_id, null: false
      t.integer :shipment_source_id, null: false
      t.integer :days_to_ship_id, null: false
      t.timestamps
    end
  end
end
