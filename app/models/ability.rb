class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new

		can [:update, :destroy], Project do |project|
			project.owner == user
		end

		can :close, Task do |task|
			(task.project != nil && task.project.owner == user)
		end
	end
end