class Payment < ActiveRecord::Base
  belongs_to :loan

  validate :does_not_overpay_loan

  def does_not_overpay_loan
    return unless paid_amount && loan
    self.errors.add(:paid_amount, 'Exceeds loan outstanding balance') if loan.outstanding_balance.to_f < paid_amount
  end
end
