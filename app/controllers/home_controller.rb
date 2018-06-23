class HomeController < ApplicationController
  def index
    @users = User.where(status: 'active')
    @count = @users.count
  end
end