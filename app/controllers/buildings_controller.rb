class BuildingsController < ApplicationController
  def index
  	@buildings = Building.all.order("id DESC")
  end

  def new
  	@building = Building.new
  end

  def create
    @building = Building.new(building_params)
    @building.user_id = user_id
    if @building.save
      redirect_to building_path(@building.id)
    else
      redirect_to new_building_path
    end
  end

  def show
  @building = Building.find(params[:id])
      respond_to do |format|
        format.html
        format.pdf do
          report = BuildingPDF.create @building
          send_data report.generate,
                    filename:    "#{@building.id}.pdf",
                    type:        "application/pdf",
                    disposition: "inline"
        end
      end
  end

# def show
#   @building = Building.find(params[:id])
#       respond_to do |format|
#         format.html
#         format.pdf do
#           report = BuildingTestPDF.new(@building)
#           send_data report.generate,
#                     filename:    "#{@building.id}.pdf",
#                     type:        "application/pdf",
#                     disposition: "inline"
#         end
#       end
# end



  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    @building.update_attributes(building_params)
    if @building.save
      #redirect_to root_path
      redirect_to building_path(id: @building.id)
    end

  end
  


  private
    def building_params
      params
      .require(:building)
      .permit(:building_name, :building_place, :building_year, :building_scale, :building_type ,:building_construction)
    end
    def user_id
    	current_user.id
    end
end 