class PortfoliosController < ApplicationController
	before_action :set_blog, only: %i[show edit update destroy ]
	def index
		@portfolio_items = Portfolio.all
	end
	def angular
		@angular_portfolio_items = Portfolio.angular
		
	end
	def ruby_on_rails
		 @ror_portfolio_items = Portfolio.ruby_on_rails_portfolio_items
	end
	def show
	end
	def new
		@portfolio_item = Portfolio.new
		3.times {@portfolio_item.technologies.build}
	end

	def create
		@portfolio_item = Portfolio.new(portfolio_params)
		respond_to do |format|
		if @portfolio_item.save
		 	format.html { redirect_to "/portfolios/", notice: 'Your portfolio is successfully created.'}
		 	format.json { render :show, status: :created, location: @portfolio}	
		else
		 	format.html { render :new, status: :unprocessable_entity}
		 	format.json { render json: @portfolio.errors, status: :unprocessable_entity}
		 end
		end
	end

	def edit

	end
	def update
		@portfolio_item 
		respond_to do |format|
			if @portfolio_item.update(portfolio_params)
				format.html { redirect_to portfolios_path, notice: 'The Record was successfully updated.'}
			else
				format.html { render :edit}
			end
		end
	end
	def destroy
			
		@portfolio_item.destroy
		respond_to do |format|
		format.html { redirect_to portfolios_path, notice: 'Post was removed' }
		format.json	{ head :no_content}
		end 
	end
private
	
	def set_blog
		@portfolio_item = Portfolio.friendly.find(params[:id])	
	end	

	def portfolio_params
		params.require(:portfolio).permit(:stitle, :subtitle, :body, :main_image, :thumb_image, technologies_attributes: [:name])
		
	end
end
