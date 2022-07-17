class CreateSituations < ActiveRecord::Migration[6.0]
  def change
    create_table :situations do |t|
      t.integer :situation_id,null: false
      t.timestamps
    end
  end
end
