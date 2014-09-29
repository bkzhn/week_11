require 'spec_helper'

describe Book do
  let(:book) { Book.new }

  it "should be an ActiveRecord::Base child" do
    expect(Book.superclass).to eq(ActiveRecord::Base)
    end

  it "should have :title attribute" do
    book.title = "A title of a book"
    expect(book.title).to eq("A title of a book")
  end

  it "should have :author attribute" do
    book.author = "Author of a book"
    expect(book.author).to eq("Author of a book")
  end

  it "should have :year attribute" do
    book.year = 2014
    expect(book.year).to eq(2014)
  end

  it "should have :isbn attribute" do
    book.isbn = "978-3-16-148410-0"
    expect(book.isbn).to eq("978-3-16-148410-0")
  end

  it "should have :description attribute" do
    book.description = "Description of a book"
    expect(book.description).to eq("Description of a book")
  end
end