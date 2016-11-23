class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    @product = Product.find(1)
    render "layouts/home"
  end

  before_filter :extract_shopping_cart

  protected
    def extract_shopping_cart
      shopping_cart_id = session[:shopping_cart_id]
      @shopping_cart = session[:shopping_cart_id] ? ShoppingCart.find(shopping_cart_id) : ShoppingCart.create
      session[:shopping_cart_id] = @shopping_cart.id
    end

end
