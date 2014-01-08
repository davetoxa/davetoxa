FactoryGirl.define do
  factory :user do
    sequence(:email){ |u| "ang#{u}@gmail.com" }
    sequence(:username){ |u| "User_#{u}" }
    sequence(:uid){ |i| i }

    factory :admin do
      after(:create) do |user|
        Rails.application.config.admins << user.username
      end
    end
  end
end
