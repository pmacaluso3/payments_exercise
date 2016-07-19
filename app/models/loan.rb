class Loan < ActiveRecord::Base
  has_many :payments

  def outstanding_balance
    total_paid_amount = payments.pluck(:paid_amount).reduce(&:+)
    funded_amount - total_paid_amount
  end
end
