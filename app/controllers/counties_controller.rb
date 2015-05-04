class CountiesController < ApplicationController
  def index
    @counties = County.all
  end

  def show 
    @county = County.find(params[:id])
  end
end