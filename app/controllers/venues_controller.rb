class VenuesController < ApplicationController
  def index
    @venues = Venue.all.order("name ASC")

    if @venues.empty?
      flash[:notice] = "There are no venues"
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @reviews = @venue.reviews
  end

  def new
    @venue = Venue.new
    @venue_categories = Venue::CATEGORIES
    @submit = "Add Venue"
  end

  def create
    @venue = Venue.new(venue_params)

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
      params.require(:venue).permit(:name, :street, :city, :state, :website, :category, :description)
    end
end
