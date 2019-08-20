class LineItemsController < ApplicationController
  include CurrentCar
  protect_from_forgery
  # before_action :set_cart, only: %i(index create)
  before_action :add_item, only: %i(show create)
  before_action :authenticate_user!, only: %i(index payment)
  before_action :get_address_default, only: %i(index)
  def index; end

  def show
    redirect_to detail_cart_url if @line_item.save
    root_path
  end

  def create
    respond_to do |format|
      format.js if @line_item.save
    end
  end

  def change_quantity_product
    @line_item = LineItem.find_by cart_id: @cart.id, product_id: params[:product_id]
    respond_to(&:js) if @line_item.update count: params[:quantity]
  end

  def add_item
    product = Product.find_by id: params[:product_id]
    count_item = params[:count_item]
    @line_item = @cart.add_product product, count_item
  end

  def get_address_default
    @address_default = nil
    if Address.get_address_default(current_user.id).size != 0
      @address_default = Address.get_address_default(current_user.id).first
      @address_receive = "#{@address_default.address_receive}, #{@address_default.ward}, #{@address_default.district}, #{@address_default.province}"
    end
  end

  def payment
    bill = Bill.new bill_params
    if bill.save
      order = Order.find_by cart_id: @cart.id
      address = Address.find_by id: bill_params[:address_id]

      OrderBill.create! bill_id: bill.id, order_id: order.id
      flash[:success] = t "flash.payment_sc"

      session[:cart_id] = nil
      current_user.update_attributes last_cart: nil
      UserMailer.send_order_for_user(current_user, order, address).deliver_now

      @cart = Cart.create
      session[:cart_id] = @cart.id

      @order = Order.create! cart_id: @cart.id, user_id: current_user.id
      current_user.update_attribute :last_cart, @order.cart_id
      redirect_to root_path
    else
      flash[:danger] = t "flash.payment_er"
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:user_id, :address_id, :total_price, :note, :status)
  end
end
