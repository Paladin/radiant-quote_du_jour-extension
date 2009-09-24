require File.dirname(__FILE__) + '/../spec_helper'

describe Quote do
  dataset :quotes
  author = 'C.S. Lewis'

  before(:each) do
    @first_quote = Quote.find(:first)
    @last_quote = Quote.find(:first)
    @random_quote = Quote.random( '' )
    @random_author_quote = Quote.random( author )
    @all_quotes = Quote.find(:all)
    @all_quotes_by_author = Quote.list(author)
  end

  it "first quote should be valid" do
    @first_quote.should be_valid
  end
  it "last quote should be valid" do
    @last_quote.should be_valid
  end
  it "random quote should be valid" do
    @random_quote.should be_valid
  end
  it "random author quote should be valid" do
    @random_author_quote.author.should == author
  end
  it "all other quotes should be valid" do
    @all_quotes.each { |quote| quote.should be_valid }
  end
  it "all quotes found by author should be by that author" do
    @all_quotes_by_author.each { |quote| quote.author.should == author }
  end
  
end
