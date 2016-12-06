class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :extract_payment
  before_action :define_next_route, only: :update

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/facts/
  def edit_fact
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
  end


  # GET /payments/1/edit
  def edit_delivery
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
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:fact_firstname, :fact_lastname, :fact_address, :fact_addresscomplement, :fact_addresscomplementbis, :fact_zipcode, :fact_city, :deliver_firstname, :deliver_lastname, :deliver_address, :deliver_addresscomplement, :deliver_addresscomplementbis, :deliver_zipcode, :deliver_city)
    end

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

    def extract_payment
      payment_id = session[:payment_id].to_i
      if Payment.exists?(payment_id)
        @payment = Payment.find(payment_id)
      else
        @payment = Payment.create
      end
      session[:payment_id] = @payment.id

      @payment.shopping_cart  = @shopping_cart

    end
end
