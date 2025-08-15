FactoryBot.define do
  factory :article do
    description { "Test description" }
    status { :published }

    after(:build) do |article|
      article.build_content(title: "Test Title") if article.content.nil?
    end

    trait :published do
      status { :published }
    end

    trait :waiting_for_review do
      status { :waiting_for_review }
    end

    trait :draft do
      status { :draft }
    end
  end
end
