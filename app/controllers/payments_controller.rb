class PaymentsController < ApplicationController
  protect_from_forgery except: :create

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    payments = Loan.find(params[:loan_id]).payments
    render json: payments
  end

  def create
    payment = Loan.find(params[:loan_id]).payments.new(paid_amount: params[:paid_amount])
    if payment.save
      render json: payment
    else
      render json: payment.errors
    end
  end

  def show
    payment = Payment.find(params[:id])
    render json: payment
  end
end
