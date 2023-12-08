class UsersController < ApplicationController
  before_action :check_user,only: [:index, :show, :destroy]
  before_action :admin_user,only: [:destroy,:make_admin]

  def index
    @users = User.all;
  end
  def show
    @user = User.where(id: params[:id]).first
    if @user.present?
        @rezervares = @user.rezervares.paginate(page: params[:page], per_page: 5)
        @rezervare = Rezervare.new
    end
  end
  
  def new
    @user=User.new
  end

  def edit
  end
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
  
  def make_admin
    @user = User.find(params[:id])
    @user.update(admin: true)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@user, partial: 'users/user', locals: { user: @user }) }
    end
  end

  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'Utilizatorul a fost șters.'
    redirect_to users_path
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

  
  private

  # Only allow a list of trusted parameters through.
  def user_params
     params.require(:user).permit(:name,:email,:password,:admin)
  end
   

end
