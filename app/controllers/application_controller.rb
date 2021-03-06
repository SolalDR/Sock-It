class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :extract_shopping_cart

  def home
    @products = Product.last(6)
    render "layouts/home"
  end

  before_filter :extract_shopping_cart, :extract_categories

  protected
    def extract_shopping_cart
      shopping_cart_id = session[:shopping_cart_id].to_i

      if ShoppingCart.exists?(shopping_cart_id)
        @shopping_cart = ShoppingCart.find(shopping_cart_id)
      else
        @shopping_cart = ShoppingCart.create
      end
      session[:shopping_cart_id] = @shopping_cart.id
    end

    def extract_categories
      @categories = Category.all
    end

end
