require 'garage'
require 'van'

describe Van do
	let (:ds) { DockingStation.new(2) }
	let (:van) { Van.new }
	let (:garage) { Garage.new }
	
	it 'collects broken bikes for repair' do
		b1 = ds.release_bike
		b2 = ds.release_bike
		ds.dock(b1, 'report')
		ds.dock(b2, 'report')
		van.collect_broken(ds)
		van.collect_broken(ds)
		expect(ds.bikes.count).to eq(0)
		expect(van.bikes.count).to eq(2)
	end
	
	it 'takes the broken bikes to a local garage' do
		b1 = ds.release_bike
		ds.dock(b1, 'report')
		van.collect_broken(ds)
		van.deliver_broken_bikes(garage)
		expect(van.bikes.count).to eq(0)
		expect(garage.bikes.count).to eq(1)
	end
end
