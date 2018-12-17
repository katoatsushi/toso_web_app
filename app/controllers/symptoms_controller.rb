class SymptomsController < ApplicationController
  def index
  	@symptoms = Symptom.where(mainpart_id: params[:mainpart_id],material_id: params[:material_id])
  end

  def show
  end
end
