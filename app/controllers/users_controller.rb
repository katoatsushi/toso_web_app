class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@my_buildings = @user.buildings
  end

  def index
  end
end
