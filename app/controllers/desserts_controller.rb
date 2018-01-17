require_relative './application_controller'
require_relative '../models/dessert.rb'

class DessertsController < ApplicationController

  def index
    @hippos = HungryHippo.all
    @desserts = Dessert.all
  end

  def show
  end

  def new
  end

  def create
    @dessert = Dessert.new(dessert_params)
    @hippos = HungryHippo.all
    @dessert.hungry_hippo_id = @hippos.sample.id

    if @dessert.save
      @desserts = Dessert.all
      render :index
      # render "/desserts/#{@dessert.id}"
    else
      render json: ['Invalid dessert parameters!'], status: 422
    end
  end

  private
  def dessert_params
    params["dessert"]
  end
end
