require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Basket" do
  it "price is 0 if its empty" do
    basket = Basket.new
    basket.get_price.should eql(0.00)
  end

  it "should add a book" do
    basket = Basket.new
    book = Book.new 1
    basket.add book
  end

  it "should apply discount to full series but not to seperate books" do
    b = Basket.new
    b.add Book.new 1
    b.add Book.new 2
    b.add Book.new 3
    b.add Book.new 4
    b.add Book.new 5

    b.add Book.new 1
    b.add Book.new 1
    b.get_price.should eql(46.0)
  end

  it "should apply discount to full series but not to seperate books" do
    b = Basket.new
    b.add Book.new 1
    b.add Book.new 1
    b.add Book.new 2
    b.add Book.new 2
    b.add Book.new 3
    b.add Book.new 3
    b.add Book.new 4
    b.add Book.new 5
    b.get_price.should eql(51.2)
  end
end
