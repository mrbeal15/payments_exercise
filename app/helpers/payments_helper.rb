module PaymentsHelper
  def calculate_payment(payment)
    if !payment[:amount].instance_of? BigDecimal
      'Funded Amount must be a Decimal'
    else
      payment[:amount].to_f
    end
  end

  def excessive_payment(loan, payment_amount)
    if payment_amount > loan[:funded_amount]
      puts "Payment Cannot Exceed Outstanding Balance"
      true
    else
      false
    end
  end

  def create_payment(loan, pending_payment)
    payment_amount = pending_payment[:amount]
    if excessive_payment(loan, payment_amount)
      {error: "Payment cannot exceed the funded amount"}
    else
      pending_payment.save
      puts "Payment Accepted!"
      new_funded_amount = loan.funded_amount - payment_amount
      loan.update(funded_amount: new_funded_amount)
      puts "New Balance: #{loan.funded_amount}"
      loan
    end
  end
end