class Portfolio < ApplicationRecord
	 has_many :technologies
      accepts_nested_attributes_for :technologies, 
                    reject_if: lambda { |attr| attr['name'].blank?}
   

     include Placeholder
     extend FriendlyId
  friendly_id :stitle, use: :slugged
  validates_presence_of  :stitle, :subtitle, :body, :main_image, :thumb_image
  def self.angular
  		where(subtitle: "Angular")
  end
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on rails")}

  after_initialize :set_defaults
  def set_defaults
      self.main_image ||=Placeholder.image_generator(height: '600', width: '400')
      self.thumb_image||= Placeholder.image_generator(height: '350', width: '200')
      # if self.main_image & thumb_image ||  == nil
            # self.main_image = "https://placehold.it/600x400"
        # end
  end
end
    
    