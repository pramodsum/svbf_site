class Event < ActiveRecord::Base

  before_validation :format_params

  validates :title, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  
  private 
	  def format_params 
	  	self.start_time = start_time.to_formatted_s(:db)
	  	self.end_time = end_time.to_formatted_s(:db)
	  end
end
