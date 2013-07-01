require 'factory_girl'

FactoryGirl.define do

	factory :user do
		sequence(:email) { |n| "email_#{n}@bk.ru" }
		password '123456'
	end 

	factory :developer, parent: :user do
		name 'Fedor'
		roles ['developer']
	end
	
	factory :admin, parent: :user do
		name 'Max'
		roles ['admin']
	end

	factory :manager, parent: :user do
		name 'Alex'
		roles ['manager']
	end

end