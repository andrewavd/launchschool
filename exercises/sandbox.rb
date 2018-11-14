names = %w(andy jackie maris doe puff sunny)
p names.partition { |name| name.size < 5 }