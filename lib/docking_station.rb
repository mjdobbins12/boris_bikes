require_relative './bike.rb'

class DockingStation
attr_reader :bikes
DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    capacity.times do
      @bikes << Bike.new
    end
  end

  def release_bike(index = 0)
    if !empty? && @bikes[index].working?
      bike = @bikes[index]
      @bikes.delete(bike)
      return bike
    else
      raise ArgumentError.new('This station is empty')
    end
  end

  def dock(bike, report = 0)
    bike.report_broken if report == 'report'
    return @bikes << bike if !full?
    raise ArgumentError.new('This station is full')
  end

  private
  def full?
     @bikes.length == DEFAULT_CAPACITY
  end

  def empty?
     @bikes.length == 0
  end
end
