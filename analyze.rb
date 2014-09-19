require 'benchmark'
require_relative 'passenger'
Dir["data_models/*.rb"].each { |file| require_relative file }

if ARGV[0].nil?
    puts "Usage: ./analyze.rb <data_model_name>"
    exit
end

model_class = Object.
  const_get(ARGV[0].split('_').collect!{ |w| w.capitalize }.join)

puts "Starting #{Time.now} - #{model_class}"

data_model = model_class.new
data_model.analyze
data_model.write_output_csv

puts "All Done! #{Time.now}"
