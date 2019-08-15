FactoryBot.define do
  factory :task do
    title { Faker::Lorem.word }
    user
  end
end