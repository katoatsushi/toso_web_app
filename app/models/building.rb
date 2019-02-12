class Building < ApplicationRecord
	belongs_to :user
	has_many :parts, foreign_key: :building_id, dependent: :destroy
	has_many :reforms, foreign_key: :building_id, dependent: :destroy
	#has_many :symptom, through: :parts
end
