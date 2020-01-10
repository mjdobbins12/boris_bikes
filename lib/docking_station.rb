require_relative './bike.rb'

class DockingStation
  attr_reader :bikes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    capacity.times do
      @bikes << Bike.new
    end
  end

  def release_bike(index = 0)
    if empty? 
      raise ArgumentError.new('This station is empty')
    elsif @bikes[index].working?
      bike = @bikes[index]
      @bikes.delete(bike)
      return bike
    else
      raise RuntimeError.new('This bike is broken')
    end
  end

  def dock(bike, report = nil)
    bike.report_broken if report == 'report'
    return (@bikes << bike) if !full?
    raise ArgumentError.new('This station is full')
  end
  
  def release_for_repair
  end

  private
  def full?
     @bikes.length == @capacity
  end

  def empty?
     @bikes.length == 0
  end
end
