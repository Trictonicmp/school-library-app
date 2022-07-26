# app/classes/core/book_lister.rb

class BookLister
  def initialize(book_list)
    @book_list = book_list
  end

  def list_books
    @books_list.each do |book|
      print "Title: \"#{book.title}\", Author: \"#{book.author}\"\n"
    end
  end

  def list_books_with_index
    @books_list.each_with_index do |book, index|
      print "#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\"\n"
    end
  end
end