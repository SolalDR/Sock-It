class ProfileController < ApplicationController
  before_action :test_user, only: [:show, :edit, :update]
  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to profile_show_path, notice: "Le produit a bien été mis à jour." }
        format.json { render :show, status: :ok, location: current_user }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def test_user
      if !current_user
        render root_path
      end
    end
    def user_params
      params.require(:user).permit(:firstname, :lastname, :address, :addresscomplement, :addresscomplementbis, :zipcode, :city)
    end
end
