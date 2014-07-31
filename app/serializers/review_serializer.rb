class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :name, :score, :suggested_by, :submitted
end
