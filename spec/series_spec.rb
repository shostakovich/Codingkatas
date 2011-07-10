require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Series" do

  it "should add books" do
    b = Book.new 1
    s = Series.new
    s.add b
  end

  it "should determine if a volume of the series is added" do
    b = Book.new 1
    s = Series.new
    s.add b

    s.has_volume(1).should eql(true)
    s.has_volume(2).should eql(false)
  end

   it "should not accept the same book twice" do
    s = Series.new
    b1 = Book.new 1
    s.add b1

    b2 = Book.new 1
    expect{s.add(b2)}.to raise_error
   end

  it "should not accept the same book twice" do
    s = Series.new
    b1 = Book.new 1
    s.add b1

    b2 = Book.new 1
    expect{s.add(b2)}.to raise_error
  end

    it "should return the price of a book if only 1 is added" do
    s = Series.new
    s.add Book.new 1
    s.get_price.should eql(8.00)
  end

  it "should apply a discount of 5% to 2 books off the series" do
    s = Series.new
    s.add Book.new 1
    s.add Book.new 2
    s.get_price.should eql(15.20)
  end

  it "should apply a discount of 10% to 3 books off the series" do
    s = Series.new
    s.add Book.new 1
    s.add Book.new 2
    s.add Book.new 3
    s.get_price.should eql(21.60)
  end

  it "should apply a discount of 20% to 4 books off the series" do
    s = Series.new
    s.add Book.new 1
    s.add Book.new 2
    s.add Book.new 3
    s.add Book.new 4
    s.get_price.should eql(25.6)
  end

  it "should apply a discount of 25% to 5 books off the series" do
    s = Series.new
    s.add Book.new 1
    s.add Book.new 2
    s.add Book.new 3
    s.add Book.new 4
    s.add Book.new 5
    s.get_price.should eql(30.0)
  end
end