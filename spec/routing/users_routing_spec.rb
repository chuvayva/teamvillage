require 'spec_helper'

describe UsersController do 
  describe 'routing' do
  	it 'home route' do
  		get('/').should route_to 'users#user_tasks'
  	end
  end
	
end