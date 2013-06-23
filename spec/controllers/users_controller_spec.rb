require 'spec_helper'

describe UsersController do
	before :all do
		#UsersController.any_instance.stub!(:current_user).and_return build(:user)
	end
	describe '#user_tasks' do
		it 'should call User#executing_tasks' do
			user = build :user
			controller.stub(:current_user).and_return user 
			user.should_receive(:executing_tasks)

			get :user_tasks
		end

		it 'should assings @viewed_tasks' do
			user = build :user
			controller.stub(:current_user).and_return user 
			tasks = [build(:task), build(:task)]
			user.stub(:executing_tasks).and_return tasks

			get :user_tasks

			assigns(:viewed_tasks).should eq(tasks)
		end
	end
  
end
