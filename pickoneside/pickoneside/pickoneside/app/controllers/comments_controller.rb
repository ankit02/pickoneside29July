class CommentsController < ApplicationController

	def create

		war_id = params[:comment].delete(:war_id)
		@comment = Comment.new(params[:comment])
		@user = User.find(current_user.id)
		@comment.war_id = war_id
		@comment.user_id = @user.id
		@comment.save

		#flash.notice = "War '#{@war.topic}' created successfully."

		redirect_to war_path(@comment.war)
		
	end

	def destroy
		@comment = Comment.find(params[:id])

		@comment.destroy

		flash.notice = "Comment destroyed..!!"

		redirect_to war_path(@comment.war)
	end
end
