class ShoppingCartController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
  end

  def clear
    @shopping_cart.clear
    render "shopping_cart/index"
  end

  def add
    product = Product.find(params[:id])
    quantity = 1

    if params.include? :quantity
      quantity = params[:quantity].to_i.abs
    end

    @shopping_cart.add(product, product.price, quantity)

    # if @shopping_cart.shopping_cart_items.include? product
    #
    # end
    redirect_to cart_path
  end

  def remove
    product = Product.find(params[:id])
    quantity = 1

    if params.include? :quantity
      quantity = params[:quantity].to_i.abs
    end

    @shopping_cart.remove(product, quantity)

    redirect_to cart_path
  end
end
