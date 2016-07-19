class LoansController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    render json: Loan.all.as_json(methods: :outstanding_balance)
  end

  def show
    render json: Loan.find(params[:id]).as_json(methods: :outstanding_balance)
  end
end
