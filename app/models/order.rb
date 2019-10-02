class Order < ApplicationRecord
    has_many :order_items

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :address_1, presence: true
    validates :city, presence: true
    validates :country, presence: true

    accepts_nested_attributes_for :order_items

    def add_from_cart(cart)
        cart.order_items.all.each do |item|
            self.order_items.new(product: item.product, quantity: item.quantity)
        end
    end

    def save_and_charge
        # Check our data is valid, and if it is, charge in Stripe and save if all is good
        
          if self.valid?
        
            Stripe.api_key = Rails.application.credentials.stripe[Rails.env.to_sym][:stripe_secret_key]
              
            Stripe::Charge.create(
              amount: self.total_price,
              currency: "eur",
              source: self.stripe_token,
              description: "Order for " + self.first_name + " " + self.last_name + " " + self.email,
              statement_descriptor: "Superhungry"
            )
              
            self.save
              
          else
            # Doesn’t pass validations
            false
          end

        rescue Stripe::CardError => e
            @message = e.json_body[:error][:message]

            self.errors.add(:stripe_token, @message)

            false 

        end

        def total_price
            @total = 0

            order_items.each do |item|
                @total = @total + item.product.price * item.quantity
            end

            @total
        end

        def total_price_in_euros
            @total = 0
            
            order_items.all.each do |item|
                @total = @total + item.product.price_in_euros * item.quantity
            end
    
            @total
    
        end

end
