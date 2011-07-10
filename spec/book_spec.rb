require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Book" do
  it "has the price of 8.00 if no discount is applied" do
    book = Book.new 1
    book.price.should eql(8.00)
  end
end
