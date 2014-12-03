class Event < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 50 }
  validates :happens_at, presence: true
  validates :location, presence: true, length: { maximum: 100 }
  validates :description, presence: true
end
