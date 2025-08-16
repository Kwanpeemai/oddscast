FactoryBot.define do
  factory :user do
    sequence(:email_address) { |n| "admin#{Time.now.to_i}_#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
