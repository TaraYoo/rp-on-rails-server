class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :plot, :visited, :outcome, :has_players
end
