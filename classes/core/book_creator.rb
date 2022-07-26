require_relative 'book'
require_relative '../../helpers/helpers'

# app/classes/core/book_creator.rb
class BookCreator
  private
  def ask_data
    title = ''
    author = ''

    until_data_ok do
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
    end

    return title, author
  end

  public
  def create_book
    title, author = ask_data
    print "Book created successfully\n\n"
    Book.new(title, author)
  end
end