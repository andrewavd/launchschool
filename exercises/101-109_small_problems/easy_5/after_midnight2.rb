# after_midnight2.rb
# Write two mathods that each take a time of day in 24 hour format, and return the number of minutes
# before and after midnight, respectivelyl. Both methods should return a value on the range 0..1439.

HOURS_DAY = 24
MINUTES_HOUR = 60
MIDNIGHT = Time.utc(2018, 9, 2)

def after_midnight_solution(str)
  hrs, mins = str.split(':')
  # time = str.chars
  # hrs = ((time[0] + time[1]).to_i) % 24
  # mins = (time[3] + time[4]).to_i
  hrs.to_i % HOURS_DAY * MINUTES_HOUR + mins.to_i
end

def before_midnight_solution(str)
  hrs, mins = str.split(':')
  # time = str.chars
  # hrs = ((time[0] + time[1]).to_i) % 24
  # mins = (time[3] + time[4]).to_i
  hrs.to_i % HOURS_DAY * MINUTES_HOUR - mins.to_i
end

# Further exploration:

def after_midnight(str)
  hrs, mins = str.split(':').map(&:to_i)
  t = Time.utc(2018, 9, 2, hrs, mins)
  (((t - MIDNIGHT) / 60) % 1440).to_i
end

def before_midnight(str)
  hrs, mins = str.split(':').map(&:to_i)
  t = Time.utc(2018, 9, 2, hrs, mins)
  (((MIDNIGHT - t) / 60) % 1440).to_i
end

p after_midnight('00:00') # == 0
p before_midnight('00:00') # == 0
p after_midnight('12:34') # == 754
p before_midnight('12:34') # == 686
p after_midnight('24:00') # == 0
p before_midnight('24:00') # == 0