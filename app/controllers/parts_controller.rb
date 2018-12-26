class PartsController < ApplicationController
#before_action :authenticate_user!
  def new
    @part = Part.new
  end

  def create
    @part = Part.new(part_params)
    @part.building_id = params[:building_id]
    @part.detail_id = params[:part][:detail_id]
    #binding.pry
    if @part.save
      redirect_to edit_building_part_path(:building_id => @part.building_id, :id=> @part.id)
    else
      redirect_to new_building_part_path
    end
  end

  def index
  end

  def show
    @part = Part.find(params[:id])
  end

  def edit
    @part = Part.find(params[:id])
    @part.cond ||= @part.detail.condition
    @part.treat ||= @part.detail.treatment
  end

  def update
    @part = Part.find(params[:id])
    @part.update_attributes(part_params)
    @part.part_type = @part.detail.detail_type
    if @part.save
      #redirect_to root_path
      redirect_to building_path(:id => @part.building_id)
    end
  end

  def destroy
    @part = Part.find(params[:id])
    @part.destroy
    redirect_to building_path(params[:building_id])

  end

  private
  # permit(:, keys: [:clubname, :clubtype, :text, :population, :profile_img , {:college_ids => []} ]) 
  def part_params
    params.require(:part).permit(:cond, :treat ,:detail_id,:building_id, :score, :part_type)
  end
end




