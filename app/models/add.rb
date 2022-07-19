class add
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_source_id, :municipalities, :address, :building_name, 
               :phone_number, :user_id, :item_id

  
  def save
    add = Add.create(user_id: user_id, item_id: item_id)
    Add.create(postal_code: postal_code, shipment_source_id: sshipment_source_id, municipalities: municipalities, address: address, building_name: building_name,phone_number: phone_number, item_id: item_id )
  end
end