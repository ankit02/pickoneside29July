class WarsController < ApplicationController

	def index 
		@wars = War.all	
	end

	def create
		@war = War.new(params[:war])

		@war.save

		#flash.notice = "War '#{@war.topic}' created successfully."

		redirect_to war_path(@war)
		
	end

	def new
		@war = War.new 

	end

	def show
		@war = War.find(params[:id])

	end
end
