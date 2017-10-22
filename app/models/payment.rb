class Payment < ActiveRecord::Base
  belongs_to :loan

  # def self.payment_amount(payment)
  #   payment.amount.to_f
  # end

  # def payment_date(payment)
  #   payment.created_at
  # end
end
