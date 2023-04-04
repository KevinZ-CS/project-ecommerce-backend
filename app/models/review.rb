class Review < ApplicationRecord
  
belongs_to :item
belongs_to :user

validates :rating, presence: { message: 'Please leave a star rating.' }
validates :comment, presence: { message: 'Please enter your comments.'}, length: { minimum: 40, maximum: 250, too_short: ' Comments must be at least 40 characters long.', too_long: ' Character limit is 250.' }
end

