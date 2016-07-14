class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :avg_rating, :created_at
end
