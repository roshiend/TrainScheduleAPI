class Trainline < ApplicationRecord
	has_many :stations, :dependent => :destroy
	before_save :upcase_trainline_attibutes

	def upcase_trainline_attibutes
         if line_name.present?
			(line_name.upcase!)
		end

		
	end

end
