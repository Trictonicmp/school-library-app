require_relative '../helpers/helpers'

# app/classes/core/book_creator.rb
class BookCreator
  private
  def ask_data
    until_data_ok do
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
    end
  end

  public
  def create_book
    title, author = ask_data
    print "Book created successfully\n\n"
    Book.new(title, author)
  end
end