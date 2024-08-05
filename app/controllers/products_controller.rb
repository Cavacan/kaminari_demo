class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page])
  end

  def create
    @product = Product.new(product_params)
    if @produt.save
      redirect_to product_path, notice: 'Product was successfully created.'
    else
      render :new, notice: 'Product create failed.'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
