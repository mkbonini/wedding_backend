class KidsController < ApplicationController
  before_action :set_kid, only: [:show, :update, :destroy]

  def index
    @kids = Kid.all
    json_response(@kids)
  end

  def create
    @kid = Kid.create!(kid_params)
    json_response(@kid, :created)
  end

  def show
    json_response(@kid)
  end

  def update
    @kid.update(kid_params)
    head :no_content
  end

  def destroy
    @kid.destroy
    head :no_content
  end

  private

  def kid_params
    params.permit(:name, :age, :guest_id, :team_id, :lodging_id)
  end

  def set_kid
      @kid = Kid.find(params[:id])
  end
end
