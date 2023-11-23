class UsersController < ApplicationController
    before_action :logged_in_user, only: [:show]
   before_action :check_user,only: [:index, :show, :destroy]
   # before_action :admin_user,only: [:destroy,:make_admin]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
     @user = User.new(user_params)
    if @user.save
        flash[:succes]="User adaugat"
        log_in(@user)
        redirect_to user_path(@user)
          else
            render 'users/new' ,status: 422
        end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def make_admin
        @user=User.find(params[:id])
        @user.update(admin:true)
    end
  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
       params.require(:user).permit(:name,:email,:password,:admin)
    end
end
