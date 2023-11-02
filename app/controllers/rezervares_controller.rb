class RezervaresController < ApplicationController
  before_action :set_rezervare, only: %i[ show edit update destroy ]

  # GET /rezervares or /rezervares.json
  def index
    @rezervares = Rezervare.all
  end

  # GET /rezervares/1 or /rezervares/1.json
  def show
  end

  # GET /rezervares/new
  def new
    @rezervare = Rezervare.new
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rezervare
      @rezervare = Rezervare.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rezervare_params
      params.require(:rezervare).permit(:nume, :prenume, :email, :telefon)
    end
end
