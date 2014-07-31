class AddSubmittedBoolToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :submitted, :boolean, default: false
  end
end
