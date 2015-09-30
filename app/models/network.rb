class Network < ActiveRecord::Base
  belongs_to :user
  validates :bssid, presence: true, uniqueness: true
end
