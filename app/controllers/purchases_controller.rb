class PurchasesController < ApplicationController
  before_action :authorize_request
  def create
    @purchase = @current_user.purchases.new(purchase_params)
    @purchase.apply_coupon(params[:coupon_code]) if params[:coupon_code].present?
    if @purchase.save
      render json: { purchase: @purchase, coupons: @purchase.purchase_coupons }, status: :created
    else
      render json: { errors: @purchase.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.permit(
      :deposit_amount, :final_balance, :generated_coupon_id, :course_id
    )
  end
end
