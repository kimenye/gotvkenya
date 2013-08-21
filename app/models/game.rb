class Game < ActiveRecord::Base
  belongs_to :fan
  attr_accessible :end_time, :num_clicks, :start_time, :total_time, :ref
end
