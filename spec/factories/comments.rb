# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    post
    user
    body 'Something'
  end
end
