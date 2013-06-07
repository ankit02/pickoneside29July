class VotingsController < ApplicationController


	def create

		#debugger

		#war_id = params[:voting].delete(:war_id)
		@voting = Voting.new(params[:voting])
		option_id = params[:voting].delete(:option_id)

		@user = User.find(current_user.id)
		# debugger
		#@comment.war_id = war_id
		@voting.user_id = @user.id
		@voting.option_id = option_id
		@voting.save
		#debugger
		#flash.notice = "War '#{@war.topic}' created successfully."

		redirect_to war_path(@voting.option.war)
		
	end

	
end
