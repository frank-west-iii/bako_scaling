# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    uuid "MyString"
    credit_limit "9.99"
    current_balance "9.99"
  end
end
