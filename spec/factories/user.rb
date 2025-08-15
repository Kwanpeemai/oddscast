FactoryBot.define do
  factory :user do
    sequence(:email_address) { |n| "admin#{n}@example.com" }
    password { "password" }
  end
end