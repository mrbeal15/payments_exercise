module LoansHelper

  def return_all_loans
    Loan.all.map do |loan|
      funded_amount = Loan.calculate_balance(loan)
      {
        id: loan.id,
        funded_amount: funded_amount
      }
    end
  end
end
