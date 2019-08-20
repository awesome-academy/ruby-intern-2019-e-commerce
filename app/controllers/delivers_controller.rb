class DeliversController < ApplicationController
  before_action :authenticate_user!, only: %i(index show)

  def index
    @delivers = current_user.delivers
    @bills = @delivers.map(&:bill)
  end

  def open_modal_change
    @bill = Bill.find_by id: params[:bill_id]
    byebug
    respond_to(&:js)
  end

  def change_status_bill
    @bill = Bill.find_by id: params[:bill_id]
    @bill.status = params[:status]
    if @bill.save
      respond_to(&:js)
    else
      flash[:danger] = t "flash.error"
      redirect_to bill_transport_path
    end
  end
end