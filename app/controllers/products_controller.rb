class ProductsController < ApplicationController
  skip_before_action :require_login, only: %i[index create]
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page])
  end

  def create
    @product = Product.new(product_params)
    if @produt.save
      redirect_to product_path, notice: t('defaults.product.created')
    else
      render :new, notice: 'Product create failed.'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
