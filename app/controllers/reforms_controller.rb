class ReformsController < ApplicationController
  def new
  	@reform = Reform.new

  end

  def create
  	@reform = Reform.new(reform_params)
  	@reform.building_id = params[:building_id]
  	#binding.pry
  	if @reform.save
  		redirect_to building_path(id: params[:building_id])
  	else
  		redirect_to new_building_reform_path(building_id: params[:id])
  	end

  end

  def edit
    @reform = Reform.find(params[:id])
  end

  def update
    @reform = Reform.find(params[:id])
    @reform.update_attributes(reform_params)
    if @reform.save
      redirect_to building_path(id:  @reform.building_id)
    end
  end

  def destroy
    @reform = Reform.find(params[:id])
    @reform.destroy
    redirect_to building_path(params[:building_id])
  end

  private

  def reform_params
  	params.require(:reform).permit(:reform_part,:reform_material,:reform_working_out,:building_id)
  end
end
