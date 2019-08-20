class StaticPagesController < ApplicationController
  def home
    @new_products = Product.order("created_at desc").limit(10)
  end
end
