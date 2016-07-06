class VenuesController < ApplicationController
  def index
    @venues = Venue.all.order("name ASC")

    if @venues.empty?
      flash[:notice] = "There are no venues"
    end
  end

  def show
    @venue = set_venue
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      flash[:notice] = "Venue successfully added!"
      redirect_to @venue
    else
      flash[:notice] = "There were problems saving your venue."
      render :new
    end
  end

  private

    def set_venue
      @venue = Venue.find(params[:id])
    end

    def venue_params
      params.require(:venue).permit(:name, :street, :city, :state, :website, :category, :description)
    end
end
