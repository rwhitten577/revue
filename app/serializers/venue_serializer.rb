class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :street, :city, :state, :description, :avg_rating, :created_at, :photo
end
