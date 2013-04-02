class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_sidebar

	def load_sidebar
  		@warsLatestNav = War.find(:all, :limit => 10,:order => 'created_at DESC')

      @warsIds = Hit.find_by_sql ["SELECT war_id FROM hits group by 
        war_id order by count(war_id) desc limit 10"]

      @warsHot = []
      @warsIds.each do |warId|
        iWar = War.find(warId.war_id)
        @warsHot.push(iWar)
      end

	end
  
end
