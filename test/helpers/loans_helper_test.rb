class LoansHelperTest < ActionView::TestCase
  test "#return_all_loans should return an array" do
    assert_instance_of(Array, return_all_loans)
  end

  test "#return_all_payments should return an array" do
    loan = Loan.new(funded_amount: 100.00)
    assert_instance_of(Array, return_all_payments(loan))
  end

  test "#calculate_loan_amount should raise an error if loan funded amount is not a 'Big Decimal'" do
    loan = {
      :funded_amount => 'string'
    }
    
    assert_equal calculate_loan_amount(loan), 'Funded Amount must be a Decimal'
  end

  test "#calculate_loan_amount should not raise an error if loan funded amount is a 'Big Decimal'" do
    test_num = BigDecimal.new(100)
    valid_loan = {
      :funded_amount => test_num
    }

    assert_equal(test_num.to_f, calculate_loan_amount(valid_loan))
  end
end
