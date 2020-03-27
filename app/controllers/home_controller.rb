class HomeController < ApplicationController
  before_action :authorize_user

  # GET /homes
  # GET /homes.json
  def index
    @title = "Home"
  end

end
