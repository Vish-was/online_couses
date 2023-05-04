class PurchasesController < ApplicationController
  before_action :authorize_request
  def create
    @purchase = @current_user.purchases.new(purchase_params)
    if @purchase.save
      status = true
      status = @purchase.apply_coupon(params[:coupon_code], @current_user) if params[:coupon_code].present?
      create_purchase(status)
    else
      render json: { errors: @purchase.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def create_purchase(status)
    if status
      render json: { purchase: @purchase, coupons: @purchase.purchase_coupons }, status: :created
    else
      render json: { errors: 'coupon has been expired or might be used' },
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
