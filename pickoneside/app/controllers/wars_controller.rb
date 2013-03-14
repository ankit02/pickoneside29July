class WarsController < ApplicationController

	include ActiveModel::MassAssignmentSecurity

	before_filter :authenticate_user!, :except => [:show, :index]

	def index 
		@wars = War.all	
	end

	def create
		#debugger

		@war = War.new(params[:war])
		@user= User.find(current_user.id)
		@war.user_id = @user.id
		@war.save
		#session[:abc] = 

		@option_comma = params[:war][:options_test]

		foo = @option_comma.split(',')

		foo.each do |optionObj|

			opt = Option.new
			opt.option = optionObj.strip
			opt.war_id = @war.id

			opt.save
			
		end		

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

		
		@voting = Voting.new

		@options = @war.options

		@totalVotes = 0
		@options.all.each do |o|
			@totalVotes = @totalVotes + Voting.where("option_id = ?", o.id).count	
		end

		if user_signed_in? 
			@user = User.find(current_user.id)
			@comment.user_id = @user.id
			@voting.user_id = @user.id
			@voted = false
			@options.all.each do |oc|
			@check = Voting.where("option_id = ?", oc.id)
			@check = @check.where("user_id = ?", @user.id)
			if not @check.empty?
				@voted=true
				break
			end
		end
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

	def search



	end


end
