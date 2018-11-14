# most_water.rb
# November 2, 2018

def create_substrings(arr)
  subs = []
  results = []
  (arr.size - 1).times do |i|
    subs = [arr[i]]
    arr[(i+1..arr.size - 1)].each do |e|
      subs = subs << e
      results << subs.clone
    end
  end
  results
end

def calc_capacity(arr)
  return 0 if arr.empty? || arr.size == 1
  all_capacities = []
  subs = create_substrings(arr)
  subs.each do |e|
    e[0] < e[-1] ? smallest = e[0] : smallest = e[-1]
    capacity = smallest * (e.size - 1)
    all_capacities << capacity
  end
  all_capacities.max
end


p calc_capacity([1,8,6,2,5,4,8,3,7])# == 49
p calc_capacity([50,56,8,2,5,4,8,3,7])