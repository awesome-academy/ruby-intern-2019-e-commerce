class ShippersController < ApplicationController
  before_action :authenticate_user!, only: %i(index show receive_bill)
  def index
    @bills = Bill.get_bill_not_transport
  end

  def show
    @bill = Bill.find_by id: params[:bill_id]
    respond_to(&:js)
  end

  def receive_bill
    @deliver = Deliver.new user_id: current_user.id, bill_id: params[:bill_id]
    @bill = Bill.find_by id: params[:bill_id]

    if @deliver.save
      @bill.update status: 1
      respond_to(&:js)
    else
      flash[:danger] = t("flash.error")
      redirect_to bill_not_transport_path
    end
  end

  def cancel_bill
    @deliver = Deliver.find_by bill_id: params[:bill_id], user_id: current_user.id
    @bill = Bill.find_by id: params[:bill_id]

    if @deliver.destroy
      @bill.update status: 0
      respond_to(&:js)
    else
      flash[:danger] = t("flash.error")
      redirect_to bill_not_transport_path
    end
  end
end
