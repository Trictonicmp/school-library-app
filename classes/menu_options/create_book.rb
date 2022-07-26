require_relative '../core/book'
require_relative '../../helpers/helpers'

# app/classes/menu_options/book_creator.rb
class CreateBook
  public
  def initialize(books_list)
    @books_list = books_list
  end

  def create_book
    title, author = ask_data
    print "Book created successfully\n\n"
    @books_list << Book.new(title, author)
  end

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
end