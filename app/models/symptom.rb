class Symptom < ApplicationRecord
	belongs_to :mainpart
	belongs_to :material
	has_many :details
end
