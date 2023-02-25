class PlusOnesController < ApplicationController
  before_action :set_plus_one, only: [:show, :update, :destroy]

  def index
    @plus_ones = PlusOne.all
    json_response(@plus_ones)
  end

  def create
    @plus_one = PlusOne.create!(plus_one_params)
    json_response(@plus_one, :created)
  end

  def show
    json_response(@plus_one)
  end

  def update
    @plus_one.update(plus_one_params)
    head :no_content
  end

  def destroy
    @plus_one.destroy
    head :no_content
  end

  private

  def plus_one_params
    model_attributes = [:name, :guest_id, :team_id, :lodging_id]
    if params.key? '_json'
      params.permit(_json: model_attributes)['_json'] 
    else
      params.permit(:name, :guest_id, :team_id, :lodging_id)
    end
  end

  def set_plus_one
      @plus_one = PlusOne.find(params[:id])
  end
end
