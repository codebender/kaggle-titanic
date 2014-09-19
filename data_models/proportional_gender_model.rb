class ProportionalGenderModel < DataModel
  def analyze
    test_passengers.each do |passenger|
      results_passengers << Passenger.new(
        id: passenger.id,
        survived: passenger.female?
      )
    end
  end
end
