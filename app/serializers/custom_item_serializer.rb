class CustomItemSerializer < ActiveModel::Serializer
include Rails.application.routes.url_helpers
attributes :id, :name, :size, :category, :sub_category, :quantity, :price, :description, :featured_image, :average_rating
has_many :reviews

def price
  "#{'%.2f' % self.object.price}"
end

def average_rating
  if self.object.reviews.size == 0
    'n/a'
  else
  average_rating = self.object.reviews.pluck(:rating).sum / self.object.reviews.pluck(:rating).size
  end
end

def featured_image
  if object.featured_image.attached?
    {
      url: rails_blob_url(object.featured_image)
    }
  end
end

end
