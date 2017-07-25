class ChargesController < ApplicationController
    require "stripe"
    Stripe.api_key ="pk_test_xV5WH7Wwyjb0MZocEMkuWpwS"
    
    def new
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key]}",
            description: "Blocipedia Membership - #{current_user.username}",
            amount: 1500
        }
    end
    
    def create
       # Creates a Stripe Customer object, for associating
       # with the charge
       customer = Stripe::Customer.create(
         email: current_user.email,
         card: params[:stripeToken]
       )
     
       # Where the real magic happens
       charge = Stripe::Charge.create(
         customer: customer.id, # Note -- this is NOT the user_id in your app
         amount: 1500,
         description: "Blocipedia Membership - #{current_user.email}",
         currency: 'usd'
       )
       
       # current_user.update_attribute(:standard, false)
       current_user.update_attributes(:role => 'premium')
     
       flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
       redirect_to root_path
       
       
     
       # Stripe will send back CardErrors, with friendly messages
       # when something goes wrong.
       # This `rescue block` catches and displays those errors.
       rescue Stripe::CardError => e
         flash[:alert] = e.message
         redirect_to new_charge_path
    end

end