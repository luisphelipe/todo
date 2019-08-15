FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@test.com" }
    password { "password" }

    trait :with_tasks do
      after(:create) do |user|
        FactoryBot.create_list(:task, 10, user: user)
      end
    end
  end
end