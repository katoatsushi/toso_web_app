class Building < ApplicationRecord
	belongs_to :user
	has_many :parts
	has_many :reforms
	#has_many :symptom, through: :parts
end
