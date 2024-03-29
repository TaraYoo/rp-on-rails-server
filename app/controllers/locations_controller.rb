# frozen_string_literal: true

class LocationsController < ProtectedController
  before_action :set_location, only: %i[show update destroy]

  # GET /locations
  def index
    @locations = current_user.locations

    render json: @locations
  end

  # GET /locations/1
  def show
    render json: @location
  end

  # POST /locations
  def create
    @location = current_user.locations.build(location_params)

    if @location.save
      render json: @location, status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(location_params)
      render json: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_location
    @location = current_user.locations.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def location_params
    params.require(:location).permit(:name, :plot, :visited, :outcome,
                                     :has_players)
  end
end
