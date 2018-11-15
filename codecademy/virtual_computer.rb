# virtual_computer.rb
# November 14, 2018

class Computer
  @@users = {}
  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "File created: #{filename}, #{username}, #{time}"
  end

  def Computer.get_users
    return @@users
  end
end

my_computer = Computer.new("andy", "maris")