FactoryGirl.define do
  factory :subscribe do
    sequence(:email){ |u| "subscriber#{u}@gmail.com" }
    active true
  end
end
