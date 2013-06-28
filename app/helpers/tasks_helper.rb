module TasksHelper
	def can_be_closed?(task)
		task.status != :closed && can?(:close, task)
	end
end
