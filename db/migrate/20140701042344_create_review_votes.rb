class CreateReviewVotes < ActiveRecord::Migration
  def change
    create_table :review_votes do |t|
      t.belongs_to :user
      t.belongs_to :review

      t.timestamps
    end
  end
end
