# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title       "My Title"
    year        2014
    description "My desctiption"
    isbn        "978-3-16-148410-0"
  end
end