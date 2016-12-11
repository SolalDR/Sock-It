class ShoppingCartController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
  end

  def clear
    @shopping_cart.clear
    render "shopping_cart/index"
  end

  def validate_facturation
  end

  def all
    @shopping_carts = ShoppingCart.all
  end

  def validate_delivery
  end

  def validate_recap
  end

  def validate_payment
  end

  def add
    product = Product.find(params[:id])
    quantity = 1
    if params.include? :quantity
      quantity = params[:quantity].to_i.abs
    end

    @shopping_cart.add(product, product.price, quantity)
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
