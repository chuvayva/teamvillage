require 'factory_girl'

FactoryGirl.define do
	factory :user do
		name 'Fedor'
		sequence(:email) { |n| "email_#{n}@bk.ru" }
		password '123456'
		roles ['developer']
	end 
end