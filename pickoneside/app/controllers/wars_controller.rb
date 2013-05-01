class WarsController < ApplicationController

	include ActiveModel::MassAssignmentSecurity

	before_filter :authenticate_user!, :except => [:show, :index, :search, :searchByCategory]

	#def index 
	#	show

	#end

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
		#respond_to do |format|
		if @war.save
		redirect_to war_path(@war)
		else
			#@categories = Category.all
		#render 'new'
        #format.html { render action: "new" }
        #format.json { render json: @war.errors, status: :unprocessable_entity }
		#end
		end
	end

	def new
		@war = War.new 
		@categories = Category.all
		@options = Option.new

	end

	def show
		if params[:id] == nil
			@war = War.last
			#debugger
		else
			@war = War.find(params[:id])
		end
		@comment = Comment.new
		@comment.war_id = @war.id
		@hit = Hit.new
		@hit.war_id = @war.id
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
			@hit.user_id = @user.id
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
		@hit.save
	end

	def edit
		@war = War.find(params[:id])
		@categories = Category.all
		#@options = "abcd"
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

		redirect_to root_path
	end

	def search
		#@warSearch = War.new

		#@wars = War.search(params[:search],params[:page])

		@wars = War.paginate(:page => params[:page], :per_page => 10).search(params[:search])
		
	end

	def searchByCategory

		if params[:post] == nil
			
		else
			
		#@wars = War.searchByCategory(params[:post][:category_id])

		@wars = War.paginate(:page => params[:page], :per_page => 10).
		searchByCategory(params[:post][:category_id])

	end
		
	end

	#def searchAction
		
		#@topicname = params[:search]		
		#debugger

			#@wars = War.where("topic like ?", "%#{params[:search]}%").to_sql
			#@wars = War.search(params[:search])
		#debugger

		#redirect_to :back 

		#respond_to do |format|
     		 #format.html # index.html.erb
     		# format.json  { render :json => @instructions }
   		 #end

	#end

	


end
