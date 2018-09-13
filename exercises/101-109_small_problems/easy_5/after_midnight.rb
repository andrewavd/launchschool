# after_midnight.rb
# The time of day can be represented as the number of minutes before or after midnight. If the number
# of minutes is positive, the time is after midnight. If the number of minutes is negative, the time
# is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24
# hour format (hh:mm). Your method should work with any integer input.

MINUTES_HOUR = 60
HOURS_DAY = 24 
# I did not use MINUTES_PER_DAY
MINUTES_PER_DAY = HOURS_DAY * MINUTES_HOUR 

def my_time_of_day(minutes)
  hrs_mins = minutes.divmod(MINUTES_HOUR)
  hrs = (hrs_mins[0] % HOURS_DAY)
  mins = (hrs_mins[1])
  #hrs = '0' + hrs.to_s if hrs < 10
  #mins = '0' + mins.to_s if mins < 10
  #hrs.to_s + ':' + mins.to_s
  format('%02d:%02d', hrs, mins)
end

# provided solution
def time_of_day_solution(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_HOUR)
  format('%02d:%02d', hours, minutes)
end

# Further exploration: How would you approach this problem if you were allowed to use ruby's
# Date and Time classes? Suppose you also needed to consider the day of week? (Assume that
# delta_minutes is the number of binutes before or after midnight between Saturday and Sunday;
# in such a method, a delta_minutes value of -4321 would need to produce a return value of
# Thursday 01:29.)

require 'date'

# Uses Time class to solve original problem, Not day specific.
def time_of_day_general(minutes)
  t = Time.utc(2018, 01, 1) + MINUTES_HOUR * minutes
  t.strftime('%H:%M')
end

# Uses Time class and starts from specific day and time of Sunday at 00:00.
def time_of_day(minutes)
  t = Time.utc(2018, 9, 2, 0, 0, 0) + MINUTES_HOUR * minutes
  t.strftime('%A %H:%M')
end

p time_of_day(0) #== "00:00"
p time_of_day(-3) #== "23:57"
p time_of_day(35) #== "00:35"
p time_of_day(-1437) #== "00:03"
p time_of_day(3000) #== "02:00"
p time_of_day(800) #== "13:20"
p time_of_day(-4231) #== "01:29"