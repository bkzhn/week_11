require 'spec_helper'

describe "Books" do
  subject { page }

  describe "New book page" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      visit root_path
      fill_in "username", with: user.username
      fill_in "password", with: user.password
      click_button "Login"
      visit new_book_path
    end

    it "should have Library App title" do
      should have_selector("title", :text => "Library App | New book")
    end

    it "should have Library App in header" do
      should have_selector("h1", :text => "Library App")
    end

    it "link 'Library App' (h1) in header has to redirect to Home page" do
      find_link("Library App")[:href].should eq(root_path)
      click_link("Library App")
      expect(current_path).to eq(root_path)
    end

    it "should have link 'Home' in main menu" do
      should have_selector(".main-menu a", :text => "Home")
    end

    it "should have link 'About' in main menu" do
      should have_selector(".main-menu a", :text => "About")
    end

    it "link 'Home' in main menu has to redirect to Home page" do
      click_link("Home")
      expect(current_path).to eq(root_path)
    end

    it "link 'About' in main menu has to redirect to About page" do
      click_link("About")
      expect(current_path).to eq(about_path)
    end

    it "should have form for new book" do
      should have_selector("form")
    end

    it "should have textfield for book title" do
      should have_selector("#book_title")
    end

    it "should have textfield for book author" do
      should have_selector("#book_author")
    end

    it "should have textfield for book year" do
      should have_selector("#book_year")
    end

    it "should have textfield for book isbn" do
      should have_selector("#book_isbn")
    end

    it "should have textfield for book description" do
      should have_selector("#book_description")
    end

    it "should have submit button for book" do
      should have_selector(".submit")
    end
  end

  describe "List (index) book page" do
    before { visit books_path }

    it "should have Library App title" do
      should have_selector("title", :text => "Library App")
    end

    it "should have Library App in header" do
      should have_selector("h1", :text => "Library App")
    end

    it "link 'Library App' (h1) in header has to redirect to Home page" do
      find_link("Library App")[:href].should eq(root_path)
      click_link("Library App")
      expect(current_path).to eq(root_path)
    end

    it "should have link 'Home' in main menu" do
      should have_selector(".main-menu a", :text => "Home")
    end

    it "should have link 'About' in main menu" do
      should have_selector(".main-menu a", :text => "About")
    end

    it "link 'Home' in main menu has to redirect to Home page" do
      click_link("Home")
      expect(current_path).to eq(root_path)
    end

    it "link 'About' in main menu has to redirect to About page" do
      click_link("About")
      expect(current_path).to eq(about_path)
    end

    it "should have table for listing books" do
      should have_selector("table")
    end

    it "should have table column for book title" do
      should have_selector("thead th", :value => "Title")
    end

    it "should have table column for book author" do
      should have_selector("thead th", :value => "Author")
    end

    it "should have table column for book year" do
      should have_selector("thead th", :value => "Year")
    end

    it "should have table column for book isbn" do
      should have_selector("thead th", :value => "ISBN")
    end

    it "should have table column for book actions" do
      should have_selector("thead th", :value => "Actions")
    end

    it "should have link to single page for book" do
      should have_selector("a", :value => "Show")
    end
  end

  describe "Show book page" do
    before(:each) do
      @book = Book.new(FactoryGirl.attributes_for(:book))
      @book.save

      visit book_path(id: @book.id)
    end

    it "should have Library App title" do
      should have_selector("title", :text => "Library App")
    end

    it "should have Library App in header" do
      should have_selector("h1", :text => "Library App")
    end

    it "link 'Library App' (h1) in header has to redirect to Home page" do
      find_link("Library App")[:href].should eq(root_path)
      click_link("Library App")
      expect(current_path).to eq(root_path)
    end

    it "should have link 'Home' in main menu" do
      should have_selector(".main-menu a", :text => "Home")
    end

    it "should have link 'About' in main menu" do
      should have_selector(".main-menu a", :text => "About")
    end

    it "link 'Home' in main menu has to redirect to Home page" do
      click_link("Home")
      expect(current_path).to eq(root_path)
    end

    it "link 'About' in main menu has to redirect to About page" do
      click_link("About")
      expect(current_path).to eq(about_path)
    end

    it "should have table for listing books" do
      should have_selector("table")
    end

    it "should have table column for book title" do
      should have_selector("tbody th", :value => "Title")
    end

    it "should have table column for book author" do
      should have_selector("tbody th", :value => "Author")
    end

    it "should have table column for book year" do
      should have_selector("tbody th", :value => "Year")
    end

    it "should have table column for book isbn" do
      should have_selector("tbody th", :value => "ISBN")
    end

    it "should have table column for book actions" do
      should have_selector("tbody th", :value => "Actions")
    end

    it "should have link to book list page" do
      should have_selector("a", :value => "List")
    end

    it "link to book list page should redirect to book index" do
      click_link("List")
      expect(current_path).to eq(books_path)
    end

    it "should have link to single page for book" do
      should have_selector("a", :value => "List")
    end
  end

  describe "Edit book page" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      visit root_path
      fill_in "username", with: user.username
      fill_in "password", with: user.password
      click_button "Login"

      @book = Book.new(FactoryGirl.attributes_for(:book))
      @book.user_id = user.id
      @book.save

      visit edit_book_path(id: @book.id)
    end

    it "should have Library App | Edit book title" do
      should have_selector("title", :text => "Library App | Edit book")
    end

    it "should have Library App in header" do
      should have_selector("h1", :text => "Library App")
    end

    it "link 'Library App' (h1) in header has to redirect to Home page" do
      find_link("Library App")[:href].should eq(root_path)
      click_link("Library App")
      expect(current_path).to eq(root_path)
    end

    it "should have link 'Home' in main menu" do
      should have_selector(".main-menu a", :text => "Home")
    end

    it "should have link 'About' in main menu" do
      should have_selector(".main-menu a", :text => "About")
    end

    it "link 'Home' in main menu has to redirect to Home page" do
      click_link("Home")
      expect(current_path).to eq(root_path)
    end

    it "link 'About' in main menu has to redirect to About page" do
      click_link("About")
      expect(current_path).to eq(about_path)
    end

    it "should have form for new book" do
      should have_selector("form")
    end

    it "should have textfield for book title" do
      should have_selector("#book_title")
    end

    it "should have textfield for book author" do
      should have_selector("#book_author")
    end

    it "should have textfield for book year" do
      should have_selector("#book_year")
    end

    it "should have textfield for book isbn" do
      should have_selector("#book_isbn")
    end

    it "should have textfield for book description" do
      should have_selector("#book_description")
    end

    it "should have submit button for book" do
      should have_selector(".submit")
    end
  end
end