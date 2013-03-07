class WarsController < ApplicationController

	def index 
		@wars = War.all	
	end

	def create
		@war = War.new(params[:war])

		@war.save

		#flash.notice = "War '#{@war.topic}' created successfully."

		redirect_to war
		
	end

	def new
		@war = War.new 

	end

	def show
		@war = War.find(params[:war])

	end
end
