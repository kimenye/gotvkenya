class HomeController < ApplicationController
  def index
  end

  def create

    @fan = Fan.new(params[:fan])
    result = @fan.save

    respond_to do |format|
      format.all { render json: @fan, status: :created, location: @fan }
    end

  end
  
  def game
    render :layout => "game"
  end
end