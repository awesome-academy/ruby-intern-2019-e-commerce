class CartsController < ApplicationController

  def destroy
    @line_item = @cart.line_items.find_by product_id: params[:product_id]
    respond_to(&:js) if @line_item.destroy
  end
end
