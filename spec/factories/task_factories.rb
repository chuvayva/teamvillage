# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    status :new
    persentage 99
    association :executer, factory: :user
    project
  end
end
