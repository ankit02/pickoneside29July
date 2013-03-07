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
		@categories = Category.all

	end

	def show
		@war = War.find(params[:id])

	end

	def edit
		@war = War.find(params[:id])
		@categories = Category.all
	end

	def update
		@war = War.find(params[:id])

		@war.update_attributes (params[:war])

		flash.notice = "War '#{@war.topic}' updated..!!"

		redirect_to war_path (@war)
	end

	def destroy
		@war = War.find(params[:id])

		@war.destroy

		flash.notice = "War '#{@war.topic}' destroyed..!!"

		redirect_to wars_path
	end

end
