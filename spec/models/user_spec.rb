require 'spec_helper'

describe User do

  describe '#role?' do

  	before :all do
  		create(:developer, name: 'Fedor')
  		create(:manager, name: 'Alex')
  		create(:admin, name: 'Max')
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

  end

  describe '#to_s' do
    it 'should return name' do
      u = User.new(:name => 'super name')
      u.to_s.should == 'super name'
    end
  end
end
