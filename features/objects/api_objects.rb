class ApiObjects

  attr_accessor :base_url,
                :book_id,
                :book_author,
                :book_title

  def initialize
    @base_url = 'api/books/'
  end


  def get_books
    headers = {content_type: :json, accept: :json}
    response = HttpClient.new.get("#{self.base_url}", headers)
    return response
  end

  def get_a_book (book_id)
    headers = {content_type: :json, accept: :json}
    response = HttpClient.new.get("#{self.base_url}/#{book_id}", headers)
    return response
  end

  def add_books (book_author, book_title)
    headers = {content_type: :json, accept: :json}
    payload = {:bookAuthor => book_author,
               :bookTitle => book_title
    }.to_json
    response = HttpClient.new.put("#{self.base_url}", payload, headers)
    return response
  end

  def add_books_noauthor (book_title)
    headers = {content_type: :json, accept: :json}
    payload = {:bookTitle => book_title
    }.to_json
    response = HttpClient.new.put("#{self.base_url}", payload, headers)
    return response
  end

  def add_books_notitle (book_author)
    headers = {content_type: :json, accept: :json}
    payload = {:bookAuthor => book_author
    }.to_json
    response = HttpClient.new.put("#{self.base_url}", payload, headers)
    return response
  end

  def add_no_book (book_id, book_author, book_title)
    headers = {content_type: :json, accept: :json}
    payload = {:bookId => book_id,
               :bookAuthor => book_author,
               :bookTitle => book_title
    }.to_json
    response = HttpClient.new.put("#{self.base_url}", payload, headers)
    return response
  end


end