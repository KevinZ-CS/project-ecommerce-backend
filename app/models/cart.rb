class Cart < ApplicationRecord
has_many :orders, dependent: :destroy
has_many :items, through: :orders
end
