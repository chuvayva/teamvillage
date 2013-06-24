class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new

		can [:update, :destroy], Project do |project|
			project.owner == user
		end

		can [:close, :destroy], Task do |task|
			task.project.try(:owner) == user
		end

		can :update, Task do |task|
			task.executer == nil ||
			task.executer == user ||
			task.project.owner == user
		end
	end
end