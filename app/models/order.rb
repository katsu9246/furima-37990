class Order
  include ActiveModel::Model
  attr_accessor :token

  validates :price, presence: true
  validates :token, presence: true
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
  end
end