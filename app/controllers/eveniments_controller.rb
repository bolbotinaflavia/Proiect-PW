class EvenimentsController < ApplicationController
  before_action :set_eveniment, only: %i[ show edit update destroy ]

  # GET /eveniments or /eveniments.json
  def index
    @eveniments = Eveniment.all
  end

  # GET /eveniments/1 or /eveniments/1.json
  def show
  end

  # GET /eveniments/new
  def new
    @eveniment = Eveniment.new
  end

  # GET /eveniments/1/edit
  def edit
  end

  # POST /eveniments or /eveniments.json
  def create
    @eveniment = Eveniment.new(eveniment_params)

    respond_to do |format|
      if @eveniment.save
        format.html { redirect_to eveniment_url(@eveniment), notice: "Eveniment was successfully created." }
        format.json { render :show, status: :created, location: @eveniment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @eveniment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eveniments/1 or /eveniments/1.json
  def update
    respond_to do |format|
      if @eveniment.update(eveniment_params)
        format.html { redirect_to eveniment_url(@eveniment), notice: "Eveniment was successfully updated." }
        format.json { render :show, status: :ok, location: @eveniment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @eveniment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eveniments/1 or /eveniments/1.json
  def destroy
    @eveniment.destroy!

    respond_to do |format|
      format.html { redirect_to eveniments_url, notice: "Eveniment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eveniment
      @eveniment = Eveniment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def eveniment_params
      params.require(:eveniment).permit(:titlu, :descriere, :timp_start, :timp_final)
    end
end
