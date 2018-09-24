# staggered_caps2.rb
# Midify the method from the previous exercise so it ignores non-alphabetic characters when determining whethe it should
# uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count
# when toggling the desired case.


def staggered_case(str)
  result = []
  cap_flag = true
  str.chars.each do |char|
    cap_flag ? result << char.upcase : result << char.downcase
    cap_flag = !cap_flag if ('a'..'z').include?(char.downcase)
  end
  result.join
end

p staggered_case('I Love Launch School!')     # == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS')                  # == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') # == 'IgNoRe 77 ThE 444 NuMbErS'
