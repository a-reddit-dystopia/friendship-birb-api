class HomeController < ApplicationController
  def index
    @users = User.where(status: 'active')
  end
end