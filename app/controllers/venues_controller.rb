class VenuesController < ApplicationController
  def index
    if params[:search]
      @venues = Venue.search(params[:search]).order('name DESC')
    else
      @venues = Venue.all.order('name ASC')
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @reviews = @venue.reviews.order("sum_votes DESC")
  end

  def new
    @venue = Venue.new
    @venue_categories = Venue::CATEGORIES
    @submit = "Add Venue"

    unless user_signed_in?
      flash[:error] = 'You must be signed in to add a new venue.'
      redirect_to venues_path
    end
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      flash[:notice] = "Venue successfully added!"
      redirect_to @venue
    else
      @venue_categories = Venue::CATEGORIES
      flash[:notice] = "There were problems saving your venue."
      flash[:errors] = @venue.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @venue = Venue.find(params[:id])
    @venue_categories = Venue::CATEGORIES
    @submit = "Save Changes"
  end

  def update
    @venue = Venue.find(params[:id])
    @venue_categories = Venue::CATEGORIES

    if @venue.update_attributes(venue_params)
      flash[:notice] = "Venue successfully saved!"
      redirect_to @venue
    else
      @venue_categories = Venue::CATEGORIES
      flash[:notice] = "There were problems saving your venue."
      flash[:errors] = @venue.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    Venue.find(params[:id]).destroy
    redirect_to venues_path
  end

  private

    def venue_params
      params.require(:venue).permit(
        :name,
        :street,
        :city,
        :state,
        :website, :category, :description, :photo
      )
    end
end
