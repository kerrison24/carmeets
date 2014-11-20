class Event < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 50 }
  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true, length: { maximum: 100 }
  validates :description, presence: true
end
