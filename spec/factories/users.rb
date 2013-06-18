FactoryGirl.define do
	factory :user do
		name 'Fedor'
		email 'email_1@bk.ru'
		encrypted_password '123456'
	end 
end