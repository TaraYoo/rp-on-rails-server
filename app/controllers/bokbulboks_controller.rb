# frozen_string_literal: true

class BokbulboksController < ProtectedController
  before_action :set_bokbulbok, only: %i[show update destroy]

  # GET /bokbulboks
  def index
    @bokbulboks = current_user.bokbulboks

    render json: @bokbulboks
  end

  # GET /bokbulboks/1
  def show
    render json: @bokbulbok
  end

  # POST /bokbulboks
  def create
    @bokbulbok = current_user.bokbulboks.build(bokbulbok_params)

    if @bokbulbok.save
      render json: @bokbulbok, status: :created, location: @bokbulbok
    else
      render json: @bokbulbok.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bokbulboks/1
  def update
    if @bokbulbok.update(bokbulbok_params)
      render json: @bokbulbok
    else
      render json: @bokbulbok.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bokbulboks/1
  def destroy
    @bokbulbok.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bokbulbok
      @bokbulbok = current_user.bokbulboks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bokbulbok_params
      params.require(:bokbulbok).permit(:description, :used)
    end
end
