# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    description "MyText"
    from "2013-10-25 23:39:05"
    to "2013-10-25 23:39:05"
  end
end
