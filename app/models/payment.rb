class Payment < ActiveRecord::Base
  belongs_to :loan

  def self.payment_amount(payment)
    if !payment[:amount].instance_of? BigDecimal
      'Funded Amount must be a Decimal'
    else
      payment[:amount].to_f
    end
  end

  def self.payment_date(payment)
    payment[:created_at]
  end

  def self.find_account(payment)
    payment[:loan_id]
  end
end
