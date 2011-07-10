Given /^An empty basket$/ do
  @basket = Basket.new
end

Then /^The price should be (\d+)\.(\d+)$/ do |arg1, arg2|
  @basket.get_price.should == "#{arg1}.#{arg2}".to_f
end

When /^I add book (\d+) in the series (\d+) times$/ do |number_in_series, copies|
  copies.to_i.times do
    book = Book.new number_in_series.to_i
    @basket.add book
  end
end


