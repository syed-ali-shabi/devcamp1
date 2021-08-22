class ApplicationController < ActionController::Base
	include DeviseWhitelist
	include SetSource
	include CurrentUserConcern
	include DefaultPageContent

	before_action :set_copyright

	def set_copyright
		@copyright = DevcampViewTool::Renderer.copyright 'Jordan Hudgens', 'All Rights reserved'
	end
end
module DevcampViewTool
	class Renderer
		def self.copyright name, msg
			 "&copy; #{Time.now.year} |  <b>#{name}</b> #{msg}".html_safe
			# "&copy; #{Time.now.year} | <b>#{name} </b> All right reserved".html_safe
		end
	end

end


