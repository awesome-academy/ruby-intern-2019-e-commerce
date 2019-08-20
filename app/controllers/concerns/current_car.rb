module CurrentCar

  private

  def set_cart
    if user_signed_in?
      if current_user.last_cart.present?
        session[:old_cart_id] = session[:cart_id]
        @cart = Cart.find_by id: current_user.last_cart
        session[:cart_id] = @cart.id
        if session[:old_cart_id] != session[:cart_id]
          @old_cart = Cart.find_by id: session[:old_cart_id]
          @old_cart.line_items.each do |line_item|
            @line_item = @cart.add_product line_item.product, line_item.count
            @line_item.save!
          end
        end
      else
        @cart = Cart.find_by id: session[:cart_id]
        @order = Order.create! cart_id: session[:cart_id], user_id: current_user.id
        current_user.update_attribute :last_cart, @order.cart_id
      end

    else
      if session[:cart_id].present?
        @cart = Cart.find_by id: session[:cart_id]
      else
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end
  end
end