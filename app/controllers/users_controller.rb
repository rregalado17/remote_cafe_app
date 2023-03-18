class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy] 
  before_action :require_login, only: [:edit, :update]

  # GET /users or /users.json
  def index
    @users = User.order(:username)
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
    unless current_user.id == @user.id 
      redirect_to user_path(@user), notice: 'You can only edit your own profile.'
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:custom_error_message_1] = "Please complete form correctly."
      render :new
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    redirect_to user_path(@user)
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

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
      params.require(:user).permit(:email, :password, :password_confirmation, :username, :job_role)
    end
end
