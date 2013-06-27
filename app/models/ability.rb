class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new

		can [:update, :destroy], Project do |project|
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

		can [:update, :destroy], User do |updated_user|
			user == updated_user or
			user.role? :admin
		end

		if user.role? :admin
				can :edit_roles, User
		end
	end
end