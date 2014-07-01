class Review < ActiveRecord::Base
  validates :name, presence: true
end
