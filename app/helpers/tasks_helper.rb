module TasksHelper
	def can_be_closed?(task)
		!task.closed? and can? :close, task
	end
end
