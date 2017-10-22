module LoansHelper

  def return_all_loans
    Loan.all.map do |loan|
      funded_amount = calculate_loan_amount(loan)
      {
        id: loan.id,
        funded_amount: funded_amount
      }
    end
  end

  def return_all_payments(loan)
    loan.payments.map {|payment| payment}
  end

  def calculate_loan_amount(loan)
    if !loan[:funded_amount].instance_of? BigDecimal
      'Funded Amount must be a Decimal'
    else
      loan[:"funded_amount"].to_f
    end
  end
end
