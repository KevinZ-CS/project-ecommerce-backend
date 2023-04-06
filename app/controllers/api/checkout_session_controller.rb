class Api::CheckoutSessionController < ApplicationController
skip_before_action :authorize_admin_user, only: :create
skip_before_action :authorize_user, only: :create

Stripe.api_key = ENV['STRIPE_SECRET_KEY']

def create

    line_items_array = params.require(:_json).map do |item|
        { price_data: {
            currency: 'usd',
            product_data: {
                name: item[:item][:name],
                images: [item[:item][:featured_image][:url]],
                metadata: {
                    id: item[:item][:id]
                },
            },
            unit_amount: (item[:item][:price].to_f * 100).to_i,
        },
        quantity: item[:quantity],
        } 
    end
   
    cart = params.require(:_json).map do |item|
        item[:cart]
    end
    
    cart_id = cart[0][:id]
   
    session = Stripe::Checkout::Session.create({
        shipping_address_collection: {allowed_countries: ['US', 'CA']},
        shipping_options: [
          {
            shipping_rate_data: {
              type: 'fixed_amount',
              fixed_amount: {amount: 0, currency: 'usd'},
              display_name: 'Free shipping',
              delivery_estimate: {
                minimum: {unit: 'business_day', value: 5},
                maximum: {unit: 'business_day', value: 7},
              },
            },
          },
          {
            shipping_rate_data: {
              type: 'fixed_amount',
              fixed_amount: {amount: 1500, currency: 'usd'},
              display_name: 'Next day air',
              delivery_estimate: {
                minimum: {unit: 'business_day', value: 1},
                maximum: {unit: 'business_day', value: 1},
              },
            },
          },
        ],
        metadata: {
          cart_id: cart_id
        },
        line_items: line_items_array,
        mode: 'payment',
        invoice_creation: {enabled: true},
        success_url: ENV['CLIENT_URL'], 
        cancel_url: ENV['CLIENT_URL_CANCEL'],
      })
      render json: {url: session.url}.to_json, status: :ok 
    
end
end
