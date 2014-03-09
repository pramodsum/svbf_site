class Event < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  # validates :time, presence: true
end
