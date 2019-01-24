class MaterialsController < ApplicationController
  def index
  	#@materials = Material.where(mainpart: params[:mainpart_id])
  	#binding.pry
  	@materials = Material.where(top_id: params[:top_id],mainpart_id: params[:mainpart_id])
  end

  def show
  end
end
