class WarsController < ApplicationController

	include ActiveModel::MassAssignmentSecurity

	def index 
		@wars = War.all	
	end

	def create
		@war = War.new(params[:war])
		@user= User.find(current_user.id)
		@war.user_id = @user.id
		@war.save

		#@option = Option.new(params[:options])

		#@option.save

		#opt = @war.options

		#foo = opt.split(',')

		#i = 0

		#for i in 0..foo.length

			#opt = Option.new
			#opt.option = foo[i]

			#opt.save
			
		#end		

		#flash.notice = "War '#{@war.topic}' created successfully."

		redirect_to war_path(@war)
		
	end

	def new
		@war = War.new 
		@categories = Category.all
		@options = Option.new

	end

	def show
		@war = War.find(params[:id])
		@comment = Comment.new
		@comment.war_id = @war.id
		if logged_in? 
		
		@user = User.find(current_user.id)
		
		@comment.user_id = @user.id
		end


	end

	def edit
		@war = War.find(params[:id])
		@categories = Category.all
		@options = Option.new
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
