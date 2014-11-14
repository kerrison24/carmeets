class Event < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 50 }
  validates :date, presence: true, length: { is: 8}
  validates :time, presence: true, inclusion: { in: 0..2400 }
  validates :location, presence: true, length: { maximum: 100 }
  validates :description, presence: true
end
