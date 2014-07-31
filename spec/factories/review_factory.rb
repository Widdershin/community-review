FactoryGirl.define do
  factory :review do
    name "Remember Hoots"
    sequence :id
    user

    factory :review_with_votes do
      after(:create) do |review, evaluator|
        create_list(:user, 5)
      end
    end

    factory :submitted_review do
      submitted true
    end
  end

end