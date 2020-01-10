require 'bike'

class Van
	attr_reader :bikes
	
	def initialize
		@bikes = []
	end
	
	def collect_broken(docking_station)
		docking_station.bikes.each do |bike|
			if bike.working? == false
				@bikes << bike
			end
		end
		docking_station.bikes.delete_if{ |bike| bike.working? == false }
	end
end
