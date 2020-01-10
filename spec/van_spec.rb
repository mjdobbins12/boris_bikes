require 'van'

describe Van do
	let (:ds) { DockingStation.new(2) }
	let (:van) { Van.new }
	
	it 'collects broken bikes for repair' do
		b1 = ds.release_bike
		b2 = ds.release_bike
		ds.dock(b1, 'report')
		ds.dock(b2, 'report')
		p ds
		van.collect_broken(ds)
		van.collect_broken(ds)
		p ds
		p van
		expect(ds.bikes.count).to eq(0)
		expect(van.bikes.count).to eq(2)
	end
end
