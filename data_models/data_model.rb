require 'csv'

class DataModel
  attr_accessor :training_passengers, :test_passengers, :results_passengers

  def initialize
    @training_passengers = []
    @test_passengers = []
    @results_passengers = []

    load_test_data
  end

  def load_test_data
    CSV.foreach('data/test.csv',
      headers: :first_row, return_headers: false) do |row|

      test_passengers << Passenger.new(
        id: row['PassengerId'].to_i,
        ship_class: row['Pclass'].to_i,
        name: row['Name'],
        sex: row['Sex'],
        age: row['Age'].to_f,
        sib_spouse_num: row['SibSp'],
        parent_child_num: row['Parch'],
        ticket_number: row['Ticket'],
        fare: row['Fare'].to_f,
        cabin: row['Cabin'],
        ebarked_from: row['Embarked'])
    end
  end

  def write_output_csv
    output_csv = CSV.open("output/#{self.class.to_s.downcase}.csv", 'w',
      headers: ['PassengerId', 'Survived'],
      write_headers: true) do |csv|

      results_passengers.each do |passenger|
        csv << [ passenger.id, passenger.survived? ? 1 : 0]
      end
    end
  end
end
