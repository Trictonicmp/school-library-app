require_relative '../core/book_lister'

# app/classes/menu_options/list_books.rb
class ListBooks
  def initialize(books_list)
    @books_list = books_list
    @book_lister = BookLister.new(books_list)
  end

  def list_books
    if @books_list.empty?
      print "There are no books\n\n"
      return
    end
    puts 'Books list'
    @book_lister.list_books
    print "\n"
  end
end