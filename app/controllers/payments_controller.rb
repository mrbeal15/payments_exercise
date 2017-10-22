class PaymentsController < ApplicationController
  include PaymentsHelper

  def index
    @response = return_all_payments(params)
    render json: @response
  end

  def show
    account_id = params[:loan_id]
    payment_id = params[:id]

    payment = Loan.find(account_id).payments.find(payment_id)

    render json: payment
  end

  def create
    payment_info = params[:payment]

    account_id = payment_info[:loan_id]
    payment_amount = Payment.payment_amount(payment_info)

    loan = Loan.find(account_id)

    pending_payment = Payment.new(amount: payment_info["amount"], loan_id: account_id)
    @response = create_payment(loan, pending_payment)
    render json: @response
  end
end
