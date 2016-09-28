class PaymentsController < ApplicationController

  before_action :require_login

  def index
  end

  def new
    @client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find(params[:id])
    @payment = Payment.new
  end

  def create
    @listing = Listing.find(Reservation.find(params[:payment][:reservation_id]).listing_id)    # TRIOUVER RESA => LISTING !!!
    @reservation = Reservation.find(params[:payment][:reservation_id])    
    @reservation.user_id = current_user.id 
    @reservation.total_price = (@reservation.end_date - @reservation.start_date) * @listing.price_per_night
    @host = "andry.developper@gmail.com"
    amount = params[:payment][:total_price]
    nonce = params[:payment_method_nonce]

    render action: :new and return unless nonce

    @result = Braintree::Transaction.sale(
      amount: "10",
      :payment_method_nonce => 'fake-valid-nonce'#params[:payment_method_nonce]
    )
    if @result.success?
      Payment.create(reservation_id: params[:payment][:reservation_id], braintree_payment_id: @result.transaction.id, status: @result.transaction.status, fourdigit: @result.transaction.credit_card_details.last_4)
      redirect_to reservation_path(:id => params[:payment][:reservation_id]), notice: "Congratulations! Your transaction is successful!"
      ReservationJob.perform_later(current_user.email, @host, @reservation.listing.id, @reservation.id)
    else
      
        a = Payment.create(reservation_id: params[:payment][:reservation_id], braintree_payment_id: @result.transaction.id, status: @result.transaction.status, fourdigit: @result.transaction.credit_card_details.last_4)
        flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
        @client_token = Braintree::ClientToken.generate
        @reservation = Reservation.find(params[:payment][:reservation_id])
        @payment = Payment.new
        render :new
    end


  end
end