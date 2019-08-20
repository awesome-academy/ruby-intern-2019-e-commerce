class AccountsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @address_default = Address.get_address_default(current_user.id).first
  end

  def manage_account
    respond_to(&:js)
  end

  def manage_address
    @addresses = Address.get_address_of_user current_user.id
    respond_to(&:js)
  end

  def manage_order
    @bills = Bill.get_bill_of_user(current_user.id)
    respond_to(&:js)
  end
end