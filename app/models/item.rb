class Item < ApplicationRecord

has_one_attached :featured_image
has_many :reviews, dependent: :destroy
has_many :users, through: :reviews
has_many :orders, dependent: :destroy
has_many :carts, through: :orders

validates :name, presence: { message: 'Name is required.'}, uniqueness: { case_sensitive: false, message: 'This name already exists.' }
validates :category, presence: { message: 'Please select a category.'}
validates :sub_category, presence: { message: 'Please select a type.'}
validates :quantity, numericality: { only_integer: true, less_than_or_equal_to: 100, message: 'Please enter valid quantity. Limit is 100.' }
validates :price, numericality: { only_numeric: true, message: 'Price is invalid.' }
validates :description, presence: { message: 'Please add a description.'}, length: { minimum: 40, maximum: 250, too_short: ' Description must be at least 40 characters long.', too_long: ' Character limit is 250.' }

validate :acceptable_image

private

def acceptable_image
    return unless featured_image.attached?
  
    unless featured_image.blob.byte_size <= 1.megabyte
      errors.add(:featured_image, "is too big")
    end

  
    acceptable_types = ["image/jpeg", "image/jpg", "image/png"]
    unless acceptable_types.include?(featured_image.content_type)
      errors.add(:featured_image, "File must be a JPEG, JPG, or PNG")
    end
end

end
