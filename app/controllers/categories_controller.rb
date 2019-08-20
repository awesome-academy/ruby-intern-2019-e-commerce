class CategoriesController < ApplicationController
  def index
    @category = Category.find_by id: params[:category_id]
    @categories = Category.all
    # @products = @category.products.paginate(page: params[:page], per_page: Settings.product.limit_product)
    if @category.childs.size.zero?
      @products = @category.products.paginate(page: params[:page], per_page: Settings.product.limit_product)
    elsif @category.childs.first.childs.size.zero?
      @products = Product.list_product_category(@category.childs.map(&:id)).paginate(page: params[:page], per_page: Settings.product.limit_product)
    elsif @category.childs.first.childs.first.childs.size.zero?
      # @products = Product.list_product_category(@category.childs.first.childs)
      @child_lv_two = Category.list_child_category(@category.childs.map(&:id))
      @products = Product.list_product_category(@child_lv_two.map(&:id)).paginate(page: params[:page], per_page: Settings.product.limit_product)
    end
  end
end
