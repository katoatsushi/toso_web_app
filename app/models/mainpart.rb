class Mainpart < ApplicationRecord
	#belongs_to :part
	has_many :materials
	belongs_to :top
end
