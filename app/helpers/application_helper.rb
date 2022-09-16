module ApplicationHelper
	def is_logged?
		session[:user_id].presence
	end
end
