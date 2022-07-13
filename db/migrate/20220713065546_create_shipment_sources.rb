class CreateShipmentSources < ActiveRecord::Migration[6.0]
  def change
    create_table :shipment_sources do |t|
      t.integer :shipment_source_id,null: false
      t.timestamps
    end
  end
end
