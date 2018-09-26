# gradebook.rb
# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that
# grade.

def get_grade(g1, g2, g3)
  avg = (g1 + g2 + g3) / 3
  case 
  when avg >= 90 then 'A'
  when avg >= 80 then 'B'
  when avg >= 70 then 'C'
  when avg >= 60 then 'D'
  else 'F'
  end
end

def get_grade_solution(g1, g2, g3)
  avg = (g1 + g2 + g3) / 3
  case avg
  when (90..100) then 'A'
  when (80..89) then 'B'
  when (70..79) then 'C'
  when (60..69) then 'D'
  else 'F'
  end
end

p get_grade(95, 90, 93)
p get_grade(50, 50, 95)
