class Reform < ApplicationRecord
	belongs_to :building, :dependent => :destroy
end
