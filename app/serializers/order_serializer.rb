class OrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :size, :total
  has_one :item
  has_one :cart

def total
  "#{'%.2f' % (self.object.item.price * self.object.quantity)}"
 
end



end
