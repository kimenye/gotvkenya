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
    @game = Game.new({ :ref => Digest::MD5.hexdigest(Time.now.to_s), :end_time => Time.now, :total_time => params[:time], :num_clicks => params[:num_clicks] })
    @fan = Fan.new({:name => params[:name], :email => params[:email]})
    @fan.save!
    @game.fan_id = @fan.id
    @game.save!
    respond_to do |format|
      format.all { render json: { :success => true }}
    end
  end

  def leaderboard
    @games = Game.all(:order => "total_time asc", :limit => 10)
    render :layout => "game"
  end
  
  def game
    render :layout => "game"
  end
end