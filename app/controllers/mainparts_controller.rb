class MainpartsController < ApplicationController
  def index
  	@mainparts = Mainpart.all
  	#binding.pry
  end

  def show
  end
end
