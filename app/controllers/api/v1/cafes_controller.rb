class Api::V1::CafesController < ApplicationController
  def index
    # search feature
    if params[:title].present?
      # search for cafe with matching title
      @cafes = Cafe.where("title ILIKE ?", "%#{params[:title]}%")
    else
      @cafes = Cafe.all
    end

    # send back json
    render json: @cafes.order(created_at: :desc)
  end

  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      render json: @cafe, status: :created
    else
      render json: { error: @cafe.errors.messages }
    end
  end

  private
  def cafe_params
    params.require(:cafe).permit(:title, :address, :picture, hours: {}, criteria: [])
  end
end
