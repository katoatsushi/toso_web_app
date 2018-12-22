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
    @parts = @building.parts
    respond_to do |format|
      format.html 
      format.pdf do
          pdf = BuildingPDF.new(@building)
            send_data pdf.render,
              filename:    "building#{@building.id}.pdf",
              type:        "application/pdf",
              disposition: "inline"
      end
    end
  end

  def edit
  end

  def update
  end
  


  private
    def building_params
      params
      .require(:building)
      .permit(:building_name, :building_place, :buliding_year, :buliding_scale, :building_type ,:building_construction)
    end
    def user_id
    	current_user.id
    end
end 