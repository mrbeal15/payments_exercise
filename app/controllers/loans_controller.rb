class LoansController < ApplicationController
  include LoansHelper

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    @response = return_all_loans
    render json: @response
  end

  def show
    loan = Loan.find(params[:id])
    payments = return_all_payments(loan)
    funded_amount = calculate_loan_amount(loan)

    @response = {
      outstanding_balance: funded_amount,
      payments: payments
    }
    
    render json: @response
  end
end
