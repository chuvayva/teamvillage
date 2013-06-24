# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    persentage 99
    association :executer, factory: :user
    project
  end
end
