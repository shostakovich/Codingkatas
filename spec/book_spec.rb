require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Book" do
  it "has the price of 8.00 if no discount is applied" do
    book = Book.new 1
    book.get_price.should eql(8.00)
  end

  it "has the price of 4.00 if discount of 50 percent is applied" do
    book = Book.new 1
    book.discount_in_percent = 50
    book.get_price.should eql(4.00)
  end
end
