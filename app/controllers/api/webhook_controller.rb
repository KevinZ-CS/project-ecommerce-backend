class Api::WebhookController < ApplicationController
skip_before_action :authorize_admin_user, only: :create
skip_before_action :authorize_user, only: :create
skip_before_action :initialize_cart, only: :create

Stripe.api_key = ENV['STRIPE_SECRET_KEY']
   
def create
    endpoint_secret = 'whsec_a4e241da6a136d7bf44bc8c18e1aa45a46fe3d861ec77728ce50912d248a5962'

    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
        event = Stripe::Webhook.construct_event(
            payload, sig_header, endpoint_secret
        )
    rescue JSON::ParserError => e
        head 400
        return { error: e }.to_json
    rescue Stripe::SignatureVerificationError => e
        head 400
        return { error: e }.to_json
    end

    case event.type
    when 'payment_intent.succeeded'
        puts "#{event.type}"
    when 'checkout.session.completed'
        order = Cart.find(event.data.object.metadata.cart_id).orders.map do |order|
            OrdersPaid.create(
            cart_id: order[:cart_id],
            item_name: Item.find(order[:item_id])[:name],
            price: Item.find(order[:item_id])[:price],
            size: order[:size],
            quantity: order[:quantity],
            user_id: order[:user_id],
            total: (order[:quantity] * Item.find(order[:item_id])[:price]).to_i,
            )
        end
    
        Cart.find(event.data.object.metadata.cart_id).destroy        
    else
        puts "Unhandled event type: #{event.type}"
    end
    head 400
end


end
