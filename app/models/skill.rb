class Skill < ApplicationRecord
	include Placeholder
	 validates_presence_of	:title, :percent_utilized
 	after_initialize :set_defaults
 def set_defaults
 	self.badge ||=Placeholder.image_generator(height: '250', width: '250')
     
      # if self.main_image & thumb_image ||  == nil
            # self.main_image = "https://placehold.it/600x400"
        # end
  
 end
end
