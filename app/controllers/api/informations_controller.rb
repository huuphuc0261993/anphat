class Api::InformationsController < ApplicationController
  def index
    @informations = Information.all
    render json: @informations
  end

  def create
    @informations = Information.new(information_params)
    if @informations.save
      render json: @informations
    else
      render json: { json: @informations.errors, status: :unprocessable_entity }
    end
  end

  def show
    @informations = Information.find(params[:id])
    render json:  @informations
  end

  def update
    @informations = Information.find(params[:id])
    if @informations.update(information_params)
      render json: { status: :ok, message: 'Success' }
    else
      render json: { json: @informations.error, status: :unprocessable_entity }
    end
  end

  def destroy
    @informations = Information.find(params[:id])
    if @informations.destroy
      render json: { json: 'Information was successfully deleted.' }
    else
      render json: { json: @informations.errors, status: :unprocessable_entity }
    end
  end

  private

  def information_params
    params.require(:information).permit(:id, :title, :description, :content, :info)
  end
end
