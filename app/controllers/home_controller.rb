class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
  end

  def create

    @fan = Fan.new(params[:fan])
    result = @fan.save

    respond_to do |format|
      format.all { render json: @fan, status: :created, location: @fan }
    end

  end

  def play
    render :layout => "application"
  end

  def leaderboard
    render :layout => "application"
  end

  def score
    respond_to do |format|
      format.all { render json: { :success => true }}
    end
  end
  
  def game
    @game = Game.new({ :ref => Digest::MD5.hexdigest(Time.now.to_s) })
    @game.save!
    render :layout => "game"
  end
end