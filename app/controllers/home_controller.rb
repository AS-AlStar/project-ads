class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    render plain: current_user.email
  end
end
