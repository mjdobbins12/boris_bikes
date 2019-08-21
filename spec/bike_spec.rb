require 'bike'

describe Bike do
  it { should respond_to(:working?)}
  it { should respond_to(:report_broken)}

  it "can change a bike to being broken" do
    bike = Bike.new
    bike.report_broken
    expect(bike.working?).to eq(false)
  end
end
