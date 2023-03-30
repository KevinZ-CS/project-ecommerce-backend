class CheckoutSessionController < ApplicationController
    skip_before_action :authorize_admin_user, only: [:index, :show, :create, :destroy, :update]
    skip_before_action :authorize_user, only: [:index, :show, :create, :destroy, :update]

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
        #need to structure line items in this format, using require json method to convert to array and converting price to int since stripe only works with int, also unit amount is price and price is in cents so 2200 would be $22.00

     


       cart = params.require(:_json).map do |item|
            item[:cart]
       end
       
 
       cart_id = cart[0][:id]
   
       #need this cart id because we're adding this to metadata when the session is created so we can retrieve it later using webhooks from even.data.object
  

#        customer = Stripe::Customer.create({
#   description: 'My First Test Customer (created for API docs at https://www.stripe.com/docs/api)',
#   metadata: {
#     cart_id: cart_id,
#   }
# })
     
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
            # customer: customer,
            # payment_intent_data: { metadata: {
            #   cart: cartSummary.to_json,
            #  }},
            metadata: {
              cart_id: cart_id
            },
            line_items: line_items_array,
            mode: 'payment',
            invoice_creation: {enabled: true},
            # These placeholder URLs will be replaced in a following step.
            success_url: ENV['CLIENT_URL'], #this will take us to whatever url we specify in our app once the checkout has been successfuly completed
            cancel_url: ENV['CLIENT_URL'],
          })
          render json: {url: session.url}.to_json, status: :ok #this url will be used by the frontend to navigate to the stripe checkout page
        
  

    end
end
