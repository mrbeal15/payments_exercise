class PaymentsHelperTest < ActionView::TestCase
  test "#calculate_payment should raise an error if payment amount is not a 'Big Decimal'" do
    payment = {
      :amount => 'string'
    }
    
    assert_equal calculate_payment(payment), 'Funded Amount must be a Decimal'
  end

  test "#calculate_payment should not raise an error if a payment amount is a 'Big Decimal'" do
    test_num = BigDecimal.new(100)
    valid_payment = {
      :amount => test_num
    }

    assert_equal(test_num.to_f, calculate_payment(valid_payment))
  end

  test "#excessive_payment should return true if the pending_payment amount exceeds the account's funded amount" do
    loan = Loan.new(funded_amount: 100.00)
    payment = Payment.new(amount: 110.00)
    payment_amount = payment[:amount]

    assert excessive_payment(loan, payment_amount)
  end

  test "#excessive_payment should return false if the pending_payment amount does not exceed the account's funded amount" do
    loan = Loan.new(funded_amount: 100.00)
    payment = Payment.new(amount: 10.00)
    payment_amount = payment[:amount]

    assert_not excessive_payment(loan, payment_amount)
  end

  test "#create_payment should return an error if it is unable to save the pending payment" do
    loan = Loan.new(funded_amount: 1000.00)
    pending_payment = Payment.new(amount: 20000.00)

    assert_equal create_payment(loan, pending_payment), {error: "Payment cannot exceed the funded amount"}
  end

  test "#create_payment should return the loan with the updated balance if the payment was valid" do
    loan = Loan.new(funded_amount: 2000.00)
    pending_payment = Payment.new(amount: 20.00)

    assert_instance_of Loan, create_payment(loan, pending_payment)
  end
end
