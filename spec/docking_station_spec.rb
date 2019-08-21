require 'docking_station'

describe DockingStation do

  let (:ds) { DockingStation.new(10) }

  it { should respond_to(:release_bike)}
  it { should respond_to(:dock)}
  it { should respond_to(:bikes)}

  it 'releases a bike' do
    expect(ds.release_bike).to be_instance_of(Bike)
  end

  it 'displays the bikes that are docked' do
    expect(subject.bikes).to be_instance_of(Array)
  end

  it 'docks a bike' do
    bike = Bike.new
    ds.dock(bike)
    expect(ds.bikes).to include(bike)
  end

  it 'raises error when no bikes are present' do
    ds = DockingStation.new(0)
    expect {ds.release_bike}.to raise_error(ArgumentError)
  end

  it "raises an error when attempting to dock a full station" do
    bike = Bike.new
    expect {subject.dock(bike)}.to raise_error(ArgumentError)
  end

  it "accepts a capacity argument" do
    ds = DockingStation.new(10)
    expect(ds.bikes.length).to eq(10)
  end

  it "defaults to a capacity of 20 when none is set" do
    expect(subject.bikes.length).to eq(20)
  end

  it "reports a broken bike when docking" do
    bike = Bike.new
    ds.dock(bike, 'report')
    expect(bike.working?).to_not eq(true)
  end

  it "doesn't release a broken bike" do
    ds = DockingStation.new(0)
    bike = Bike.new.report_broken
    ds.dock(bike)
    expect {ds.release_bike}.to raise_error(NoMethodError)
  end
end
