require 'spec_helper'

describe User do

  describe '#role?' do

  	before :all do
  		create(:user, name: 'Fedor', roles: ['developer'])
  		create(:user, name: 'Alex', roles: ['manager'])
  		create(:user, name: 'Max', roles: ['admin'])
  	end

  	it 'should be admin' do
  		assert User.find_by_name('Max').role? :admin
  	end

  	it 'should be manager' do
  		assert User.find_by_name('Alex').role? :manager
  	end

  	it 'should be developer' do
  		assert User.find_by_name('Fedor').role? :developer
  	end

  	after :all do
  		# User.delete_all
  	end

  end
end
