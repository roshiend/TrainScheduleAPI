class Station < ApplicationRecord
	belongs_to :trainline
	before_save :upcase_station_attibutes

	def upcase_station_attibutes
		station_name.upcase!
		station_code.upcase!
	end

end
