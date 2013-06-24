module TasksHelper
	def can_be_closed?(task)
		!task.closed? && can?(:close, task)
	end
end
