class CafesController < ApplicationController
  skip_before_action :authorize
  before_action :set_cafe, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:show, :index]

  # GET /cafes/1 or /cafes/1.json
  def show
    @cafe = Cafe.find(params[:id])
    @review = Review.new
    @reviews = @cafe.reviews
  end

  # GET /cafes or /cafes.json
  def index
    @cafes = Cafe.all
  end

  # GET /cafes/new
  def new
    @cafe = Cafe.new
  end

  # GET /cafes/1/edit
  def edit
  end

  # POST /cafes or /cafes.json
  def create
    @user = User.find_by_id(session[:user_id])
    @cafe = Cafe.new(cafe_params.merge(user_id: current_user.id))
    if @cafe.save 
      flash[:notice] = "Cafe created successfully!"
      redirect_to @cafe 
    else
      render "new"
    end
  end

  # PATCH/PUT /cafes/1 or /cafes/1.json
  def update
    respond_to do |format|
      if @cafe.update(cafe_params)
        format.html { redirect_to cafe_url(@cafe), notice: "Cafe was successfully updated." }
        format.json { render :show, status: :ok, location: @cafe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cafes/1 or /cafes/1.json
  def destroy
    @cafe.destroy

    respond_to do |format|
      format.html { redirect_to cafes_url, notice: "Cafe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cafe
      @cafe = Cafe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cafe_params
      params.require(:cafe).permit(:title, :description, :longitude, :latitude, :rating, :user_id, :id)
    end

    def require_login
      return head(:forbidden) unless session.include? :user_id
    end
end
