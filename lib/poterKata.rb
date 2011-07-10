class Book
  attr_reader :number_in_series
  attr_accessor :price

  def initialize(number_in_series, price=8.00)
    @number_in_series = number_in_series
    @price = price
  end
end

class Series
  def initialize
    @books = []
  end

  def add(book)
    if has_volume(book.number_in_series)
      throw ArgumentError, "You cannot add the same volume off a series twice", caller
    end
    @books << book
  end

  def has_volume(nr_in_series)
    @books.each do |b|
      if b.number_in_series == nr_in_series
        return true
      end
    end
    false
  end

  def get_price
    price = 0.00
    @books.each do |b|
      price += b.price - ((get_discount_in_percent * b.price) / 100)
    end
    price
  end

  def get_discount_in_percent
    case @books.length
      when 2
        5
      when 3
        10
      when 4
        20
      when 5
        25
      else
        0
    end
  end
end

class Basket
  def initialize
    @series = [Series.new]
  end

  def get_price
    price = 0.00
    @series.each do |s|
      price += s.get_price
    end
    price
  end

  def add(book)
    @series.each do |s|
      unless s.has_volume book.number_in_series
        return s.add book
      end
    end
    serie = Series.new
    serie.add book
    @series << serie
  end
end

