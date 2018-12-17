class DetailsController < ApplicationController
  def index
    @details = Detail.where(mainpart_id: params[:mainpart_id],material_id: params[:material_id],symptom_id: params[:symptom_id])
  end

  def show
    @detail = Detail.find(params[:id])
  end

  def new
    @detail = Detail.new
  end

  def create
    @detail = Detail.new(detail_params)
    if @detail.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @detail = Detail.find(params[:id])
  end

  def update
    @detail = Detail.find(params[:id])
  end

  def destroy
    @detail = Detail.find(params[:id])
  end

  private

    def detail_params
      params.require(:detail).params(:detail_name, :condition, :treatment, :material_id, :mainpart_id, :symptom_id ,:detail_type)
    end
end
