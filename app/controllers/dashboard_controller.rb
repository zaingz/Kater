class DashboardController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_as_super_admin, only: [:super_admin]

  def super_admin
  end

  def manager_admin
  end
end
