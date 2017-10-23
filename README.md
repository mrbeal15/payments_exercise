# Payments Exercise

Add in the ability to create payments for a given loan using a JSON API call. You should store the payment date and amount.

Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`.

The outstanding balance should be calculated as the `funded_amount` minus all of the payment amounts.

A payment should not be able to be created that exceeds the outstanding balance of a loan. You should return validation errors if a payment can not be created.

Expose endpoints for seeing all payments for a given loan as well as seeing an individual payment.


Routes and Expected Payloads / Respones

#GET /loans 
returns an array containing all loan objects

sample response
```
[{"id":1,"funded_amount":"2520.0"},{"id":2,"funded_amount":"40.0"}]
```

#GET /loans/:loan_id
returns the loan found with the loan_id param

sample response
```
{"outstanding_balance":"40.0","payments":[{"id":30,"loan_id":2,"amount":"20.0","created_at":"2017-10-22T15:02:20.452Z","updated_at":"2017-10-22T15:02:20.452Z"}]}
```

#GET /loans/:loan_id/payments
returns all of the payments found for a given loan

sample response
```
[{"id":30,"loan_id":2,"amount":"20.0","created_at":"2017-10-22T15:02:20.452Z","updated_at":"2017-10-22T15:02:20.452Z"}]
```

#GET /loans/:loan_id/payments/:payment_id
returns a specified payment for a given loan

sample response
```
{"id":30,"loan_id":2,"amount":"20.0","created_at":"2017-10-22T15:02:20.452Z","updated_at":"2017-10-22T15:02:20.452Z"}
```

#POST /loans/:loan_id/payments
creates a new payment for the given loan 

sample payload
```
{"payment": {"amount": 3.00, "loan_id": 2}}
```

sample response - should return a loans new balance
```
{"id":2,"funded_amount":"37.0","created_at":"2017-10-21T18:56:41.001Z","updated_at":"2017-10-22T15:44:52.317Z"}
```

If payment amount exceeds the remaining balance for a loan it should return the following response
```
{error: "Payment cannot exceed the funded amount"}
```

#GET /loans/:loan_id/payments/:payment_id
returns the specified payment for a given loan

sample response
```
{"id":29,"loan_id":1,"amount":"20.0","created_at":"2017-10-22T13:44:27.643Z","updated_at":"2017-10-22T13:44:27.643Z"}
```
