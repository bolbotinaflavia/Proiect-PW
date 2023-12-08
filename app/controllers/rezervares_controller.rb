class RezervaresController < ApplicationController
  before_action :set_rezervare, only: %i[ show edit update destroy ]
  before_action :check_user_rezervare, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:destroy, :index]
  # GET /rezervares or /rezervares.json
  def index
    @rezervares = Rezervare.all
   # @eveniment = Eveniment.find(params[:eveniment_id]) # sau cumva obțineți evenimentul
    #@tour = Tour.find(params[:tour_id]) # sau cumva obțineți turul
  end

  # GET /rezervares/1 or /rezervares/1.json
  def show
    @rezervare = Rezervare.find_by(id: params[:id])
    unless @rezervare
      flash[:alert] = "Rezervare not found"
      redirect_to rezervares_path
    end
  end

  # GET /rezervares/new
  def new
    respond_to do |format|
      format.html
      format.js
    end
    @user = current_user
    @rezervare = Rezervare.new
    @rezervare.tours_id = params[:tour_id]
  end

  # GET /rezervares/1/edit
  def edit
  end

  # POST /rezervares or /rezervares.json
  def create
    @rezervare = Rezervare.new(rezervare_params)

    respond_to do |format|
      if @rezervare.save
        format.html { redirect_to rezervare_url(@rezervare), notice: "Rezervare was successfully created." }
        format.json { render :show, status: :created, location: @rezervare }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rezervare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rezervares/1 or /rezervares/1.json
  def update
    respond_to do |format|
      if @rezervare.update(rezervare_params)
        format.html { redirect_to rezervare_url(@rezervare), notice: "Rezervare was successfully updated." }
        format.json { render :show, status: :ok, location: @rezervare }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rezervare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rezervares/1 or /rezervares/1.json
  def destroy
    @rezervare.destroy!

    respond_to do |format|
      format.html { redirect_to rezervares_url, notice: "Rezervare was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def check_user_rezervare
    # Verifică dacă utilizatorul curent este prezent și setează logica pentru acces
    if params[:id].present?
      # Dacă este o acțiune specifică asupra unei rezervări (show, edit, update, destroy)
      @rezervare = Rezervare.find(params[:id])
      redirect_to(root_url) unless current_user.present? && (@rezervare.user == current_user || current_user.admin?)
    else
      # Pentru acțiuni generale (index, new, create)
      redirect_to(root_url) unless current_user.present?
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rezervare
      @rezervare = Rezervare.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rezervare_params
      params.require(:rezervare).permit(:tours_id, :user_id, :nume, :prenume, :email, :telefon)
    end
  
    
end
