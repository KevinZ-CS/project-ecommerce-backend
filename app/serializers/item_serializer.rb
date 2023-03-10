class ItemSerializer < ActiveModel::Serializer
include Rails.application.routes.url_helpers
  attributes :id, :name, :size, :category, :quantity, :price, :description, :featured_image

  def featured_image
    if object.featured_image.attached?
      {
        url: rails_blob_url(object.featured_image)
      }
    end
  end

end
