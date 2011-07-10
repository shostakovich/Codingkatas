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

  it "should return the price of a book if only 1 is added" do
    basket = Basket.new
    basket.add Book.new 1
    basket.get_price.should eql(8.00)
  end

  it "should apply a discount of 5% to 2 books off the series" do
    basket = Basket.new
    basket.add Book.new 1
    basket.add Book.new 2
    basket.get_price.should eql(15.20)
  end

  it "should apply a discount of 10% to 3 books off the series" do
    basket = Basket.new
    basket.add Book.new 1
    basket.add Book.new 2
    basket.add Book.new 3
    basket.get_price.should eql(21.60)
  end

  it "should apply a discount of 15% to 4 books off the series" do
    basket = Basket.new
    basket.add Book.new 1
    basket.add Book.new 2
    basket.add Book.new 3
    basket.add Book.new 4
    basket.get_price.should eql(25.6)
  end

  it "should apply a discount of 15% to 4 books off the series" do
    basket = Basket.new
    basket.add Book.new 1
    basket.add Book.new 2
    basket.add Book.new 3
    basket.add Book.new 4
    basket.add Book.new 5
    basket.get_price.should eql(30.0)
  end

  it "should only apple a discount to 2 of 3 books if only these 2 are from the same series" do
    basket = Basket.new
    basket.add Book.new 1
    basket.add Book.new 1
    basket.add Book.new 2
    basket.get_price.should eql(23.2)
  end
end
