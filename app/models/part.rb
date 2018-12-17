class Part < ApplicationRecord
	belongs_to :building
	belongs_to :detail
end
