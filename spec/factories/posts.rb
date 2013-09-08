# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    sequence(:title){ |n| "Post #{n}" }
    content 'Post content here'
    user
  end
end
