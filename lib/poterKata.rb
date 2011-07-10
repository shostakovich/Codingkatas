class Book
  attr_reader :number_in_series
  attr_accessor :discount_in_percent

  def initialize(number_in_series)
    @number_in_series = number_in_series
    @discount_in_percent = 0
  end

  def get_price
    8.00 - (8.00 * @discount_in_percent / 100)
  end
end

class Basket
  def initialize
    @books = []
  end

  def get_price
    apply_discounts
    price = 0.00
    @books.each do |b|
      price += b.get_price
    end
    price
  end

  def add(book)
    @books << book
  end

  private

  def apply_discounts
    books_in_series = @books.length

    @books.each do |b|
      b.discount_in_percent = 5 if books_in_series == 2
      b.discount_in_percent = 10 if books_in_series == 3
      b.discount_in_percent = 20 if books_in_series == 4
      b.discount_in_percent = 25 if books_in_series == 5
    end
  end
end

