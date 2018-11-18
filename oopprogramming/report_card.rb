# report_card.rb
# November 18, 2018

# INHERITANCE
# 7)
# Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so
# joe.grade will raise an error. Create a better_grade_than? method, that you can call like so:
# puts "Well done!" if joe.better_grade_than?(bob)

class Student
  attr_reader :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  def to_s
    "#{name} is a student."
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new('Joe', 90)
bob = Student.new('Bob', 70)

puts "Well done!" if joe.better_grade_than?(bob)