# fix_books1.rb
# December 23, 2018

class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neal Stephenson", "Snow Crash")

# demonstrates % notation and literals.
puts %(The author of "#{book.title}" is #{book.author}.)
puts "The author of \"#{book.title}\" is #{book.author}."
puts %(book = #{book}.)
puts "book = #{book}."
