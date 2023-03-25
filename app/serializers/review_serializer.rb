class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :rating, :item_id, :user_id, :username
  # has_one :item
  # has_one :user

  
  def username
    self.object.user.first_name
  end

end
