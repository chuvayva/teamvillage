class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new

		can [:update, :destroy], Project do |project|
			project.owner == user
		end
	end
end