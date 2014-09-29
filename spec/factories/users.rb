# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username              "my_username"
    email                 "my@email.com"
    password              "my_password"
    password_confirmation "my_password"
  end
end