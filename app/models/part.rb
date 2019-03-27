class Part < ApplicationRecord
	belongs_to :building
	belongs_to :detail
	#has_one :detail
	validates :detail_id, presence: true
end
