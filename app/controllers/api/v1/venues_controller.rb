class Api::V1::VenuesController < ApplicationController
  def index
    render json: Venue.all.order('created_at DESC')
  end
end
