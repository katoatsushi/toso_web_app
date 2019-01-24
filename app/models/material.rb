class Material < ApplicationRecord
	belongs_to :top
	belongs_to :mainpart
	has_many :symptoms
end
