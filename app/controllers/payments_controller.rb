class PaymentsController < ApplicationController
  before_action :extract_payment, except: :index
  before_action :define_next_route, only: :update
  before_action :hydrate_present_attributes, only: [:edit_fact, :edit_delivery]
  before_action :test_admin, only: :index

  # GET /payments/all
  # Liste de toute les commande (debuggage)
  def index
    @payments = Payment.all
  end

  # GET /payments/fact
  #Formulaire de la facturation
  def edit_fact
    if @shopping_cart.shopping_cart_items.length < 1
      redirect_to root_path
    end
  end

  # GET /payments/delivery
  #Formulaire de la livraison
  def edit_delivery
    if !test_present_attributes([:fact_firstname, :fact_lastname, :fact_address, :fact_zipcode, :fact_city])
      redirect_to payments_fact_path
    end
  end

  # GET /payments/show
  #Récapitulatif du paiement
  def show
    if !test_present_attributes([:deliver_firstname, :deliver_lastname, :deliver_address, :deliver_zipcode, :deliver_city])
      redirect_to payments_delivery_path
    end
  end

  # GET /payments/buy
  #Lancement de l'achat
  def new_charge
  end


  # GET /payments/success
  #Rendu du succès après achat
  def success
  end


  # POST /payments/charge
  #Lance l'action de l'achat
  def buy
    @amount = (@payment.shopping_cart.total*100).to_i

    customer = Stripe::Customer.create(
      :email => @payment.user.email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    @shopping_cart.save
    session[:shopping_cart_id] = nil
    session[:payment_id] = nil

    redirect_to payments_success_path
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to payments_success_path
  end


  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @next_route, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def test_admin
      if !current_user || !current_user.admin
        redirect_to root_path
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:fact_firstname, :fact_lastname, :fact_address, :fact_addresscomplement, :fact_addresscomplementbis, :fact_zipcode, :fact_city, :deliver_firstname, :deliver_lastname, :deliver_address, :deliver_addresscomplement, :deliver_addresscomplementbis, :deliver_zipcode, :deliver_city)
    end

    #Définis la route suivante après submit
    def define_next_route
      step = params[:payment][:step]
      if !step.empty?
        case step
        when "fact"
          @next_route = "/payments/delivery"
        when "delivery"
          @next_route = "/payments/show"
        when "recap"
          @next_route = "/payments/buy"
        end
      else
        @next_route = "/"
      end
    end

    #Récupère l'objet paiment et assigne les attributs nécéssaire :
    #user / shopping_cart / session[:payment_id]
    def extract_payment
      payment_id = session[:payment_id].to_i
      if Payment.exists?(payment_id)
        @payment = Payment.find(payment_id)
      else
        @payment = Payment.create
      end
      session[:payment_id] = @payment.id

      if current_user
        if current_user != @payment.user
          @payment.user = current_user
        end
      else
        @payment.user = User.where(email: "guest@guest.com").first
      end

      @payment.shopping_cart  = @shopping_cart
    end


    # test la présence des attribut listé dans l'objet paiment
    def test_present_attributes(attributes)
      testPresence = true
      attributes.each do |a|
        if !@payment.attribute_present?(a)
          return false
        end
      end
    end


    #Hydrate les attributs par défault en fonction des données préenregistrer
    def hydrate_present_attributes
      fact_attributes = [:fact_firstname, :fact_lastname, :fact_address, :fact_zipcode, :fact_city]
      deliver_attributes = [:deliver_firstname, :deliver_lastname, :deliver_address, :deliver_zipcode, :deliver_city]
      user_attributes = [:firstname, :lastname, :address, :zipcode, :city]
      i=0
      while i<user_attributes.length do
        if !@payment[fact_attributes[i]] && @payment.user[user_attributes[i]]
          @payment[fact_attributes[i]] = @payment.user[user_attributes[i]]
        end
        if !@payment[deliver_attributes[i]] && @payment[fact_attributes[i]]
          @payment[deliver_attributes[i]] = @payment[fact_attributes[i]]
        end
        i += 1
      end
    end
end
