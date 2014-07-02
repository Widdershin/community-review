FactoryGirl.define do
  factory :review do
    name "Remember Hoots"
    id 1

    factory :review_with_votes do
      after(:create) do |review, evaluator|
        create_list(:user, 5)
      end
    end
  end

end