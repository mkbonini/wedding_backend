class DashboardController < ApplicationController
  def index
    @dashboard = DashboardFacade.new
    json_response(@dashboard)
  end
end