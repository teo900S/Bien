class ReviewsController < ApplicationController

# check if loged in
before_action :check_login, except: [:index, :show]

  def index
    #this is our list page of rour reviews
    @price = params[:price]
    @cuisine =params[:cuisine]
    @location = params[:location]

    #start by getting all the ReviewsController
    @reviews = Review.all

    #filter by price
    if @price.present?
      @reviews = @reviews.where(price: @price)
    end

    #filter by cuisine
    if @cuisine.present?
      @reviews = @reviews.where(cuisine: @cuisine)
    end

    # search near the location
    if @location.present?
      @reviews = @reviews.near(@location)
    end


  end


  def new
    # the form for adding a new review
    @review = Review.new

  end


  def create
    # take information from the form and add it to the model
    @review = Review.new(form_params)

    # and then associate it with a user
    @review.user = @current_user

    # we want to check if the model can be saved
    # if it is, we're goint to the home page again
    #if it ins't, show the new form
    if @review.save
      redirect_to root_path
    else
      # show the view for new.html.erb
      render "new"

    end

  end


  def show
    # individual review page
    @review = Review.find(params[:id])

  end



  def destroy
    # find the individual review
    @review = Review.find(params[:id])

    # destroy if they have access
    if @review.user == @current_user
    @review.destroy
    end

    # redirect to the home page
    redirect_to root_path

  end




  def edit
    # find the individual review
    @review = Review.find(params[:id])

    if @review.user != @current_user
      redirect_to root_path
  # elsif @review.create.at < 1.hour.time_ago
elsif @review.created_at < 1.hour.ago
      redirect_to review_path(@review)

    end

  end



  def update
    # find the individual review
    @review = Review.find(params[:id])

    if @review.user != @current_user
      redirect_to root_path
    else
      #update with the new info from the form
      if @review.update(form_params)

        # redirect somewhere new
        redirect_to review_path(@review)
      else
        render "edit"
      end
    end


  end


  def form_params
    params.require(:review).permit(:title, :restaurant, :body, :cuisine, :price, :score, :address, :photo)


  end

end
