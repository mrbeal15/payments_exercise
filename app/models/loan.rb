class Loan < ActiveRecord::Base
  has_many :payments

  def self.calculate_balance(loan)
    if !loan[:funded_amount].instance_of? BigDecimal
      'Funded Amount must be a Decimal'
    else
      loan[:"funded_amount"].to_f
    end
  end

  def self.find_payments(loan)
    loan.payments(loan_id: loan.id)
  end
end
