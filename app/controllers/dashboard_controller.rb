class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @url = Url.new
    @data = Url.where(user_id: current_user.id)
  end

end
