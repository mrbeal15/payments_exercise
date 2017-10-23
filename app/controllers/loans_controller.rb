class LoansController < ApplicationController
  include LoansHelper

  def index
    @response = return_all_loans
    render json: @response
  end

  def show
    loan = Loan.find(params[:id])
    funded_amount = Loan.calculate_balance(loan)
    payments = Loan.find_payments(loan)

    @response = {
      outstanding_balance: funded_amount,
      payments: payments
    }
    
    render json: @response
  end
end
