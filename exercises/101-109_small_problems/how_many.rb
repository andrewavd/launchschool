# Write a method that counts the number of occurrences
# of each element in a given array.

def count_occurrences(vehicles)
  unique = vehicles.uniq
  unique.each do |vehicle|
    puts("#{vehicle} => #{vehicles.count(vehicle)}")
  end
end

vehicles = %w(car car truck car SUV truck motorcycle motorcycle car truck)

count_occurrences(vehicles)
