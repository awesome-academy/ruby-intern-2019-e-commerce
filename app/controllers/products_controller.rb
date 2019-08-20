class ProductsController < ApplicationController
  def index
    @item = Product.find_by id: params[:product_id]
    @categories = Category.all
    @questions = Question.get_question_product(params[:product_id]).order("created_at DESC")
    @question = Question.new
  end

  def show
    @product = Product.find_by id: params[:product_id]
    respond_to do |format|
      format.js
    end
  end
end