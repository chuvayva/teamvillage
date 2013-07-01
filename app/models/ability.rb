class Ability
	include CanCan::Ability

	def initialize(user)
		can [:read,:create,:user_tasks], :all
		
		user ||= User.new

		can [:update, :destroy], Project do |project|
			project.owner == nil or
			user.owner_of?(project)
		end

		can [:close, :destroy], Task do |task|
			user.owner_of?(task.project)
		end

		can :update, Task do |task|
			task.executer == nil or
			user.executer_of?(task) or
			user.owner_of?(task.project)
		end

		if user.role? :admin
				can [:update, :destroy], User 

				can [:block, :edit_roles], User do |edited_user|
					user != edited_user
				end
		else
			can [:update, :destroy], User do |updated_user|
				user == updated_user
			end
		end
	end
end