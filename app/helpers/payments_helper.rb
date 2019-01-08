module PaymentsHelper
  def format_total_payment(current_payment)
      number_to_currency(current_payment.transactionTotalAmount.to_f / 100 )
  end

end
