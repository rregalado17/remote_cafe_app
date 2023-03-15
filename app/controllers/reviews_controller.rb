class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :require_login

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # POST /reviews or /reviews.json
  def create
    @cafe = Cafe.find(params[:cafe_id])
    @review = @cafe.reviews.create(review_params.merge(user_id: current_user.id))
    if @review.save
      redirect_to cafe_path(@cafe)
    end
    @review = Review.new(review_params)
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cafe = Cafe.find(params[:cafe_id])
    @review = Review.find(params[:id])
    @review.destroy 
    redirect_to @cafe
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:user_id, :title, :review, :cafe_id)
    end

    def require_login
      return head(:forbidden) unless session.include? :user_id
    end
end

