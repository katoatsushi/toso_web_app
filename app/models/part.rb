class Part < ApplicationRecord
	belongs_to :building, :dependent => :destroy
	belongs_to :detail
end
