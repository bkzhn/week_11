require 'spec_helper'

describe "Users" do
  subject { page }

  describe "Registration (new user) page" do
    before { visit register_path }

    it "should have Library App | Registration title" do
      should have_selector("title", :text => "Library App | Registration")
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

    it "should have form for new user" do
      should have_selector("form")
    end

    it "should have textfield for username" do
      should have_selector("#user_username")
      # should have_selector("#user_username")
    end

    it "should have textfield for email" do
      should have_selector("#user_email")
    end

    it "should have textfield for password" do
      should have_selector("#user_password")
    end

    it "should have textfield for password confirmation" do
      should have_selector("#user_password_confirmation")
    end

    it "should have submit button for user" do
      should have_selector(".submit")
    end
  end

  describe "List (index) user page" do
    before { visit users_path }

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

    it "should have table for listing users" do
      should have_selector("table")
    end

    it "should have table column for username" do
      should have_selector("thead th", :value => "Username")
    end

    it "should have table column for user email" do
      should have_selector("thead th", :value => "Email")
    end

    it "should have table column for user actions" do
      should have_selector("thead th", :value => "Actions")
    end

    it "should have link to single page for user" do
      should have_selector("a", :value => "Show")
    end

    it "should have link to edit page for user" do
      should have_selector("a", :value => "Edit")
    end

    it "should have link to delete user" do
      should have_selector("a", :value => "Delete")
    end
  end

  describe "Show user page" do
    before(:each) do
      @user = User.new(FactoryGirl.attributes_for(:user))
      @user.save

      visit user_path(id: @user.id)
    end

    it "should have Library App | %username% title" do
      should have_selector("title", :text => "Library App | #{@user.username}")
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

    it "should have table column for username" do
      should have_selector("tbody th", :value => "Username")
    end

    it "should have table column for user email" do
      should have_selector("tbody th", :value => "Email")
    end

    it "should have link to user list page" do
      should have_selector("a", :value => "List")
    end

    it "link to user list page should redirect to user index action" do
      click_link("List")
      expect(current_path).to eq(users_path)
    end

    it "should have link to single page for book" do
      should have_selector("a", :value => "List")
    end
  end

  describe "Edit user page" do
    before(:each) do
      @user = User.new(FactoryGirl.attributes_for(:user))
      @user.save

      visit root_path
      fill_in "username", with: @user.username
      fill_in "password", with: @user.password
      click_button "Login"

      visit edit_user_path(id: @user.id)
    end

    it "should have Library App | Edit user title" do
      should have_selector("title", :text => "Library App | Edit user")
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

    it "should have form for new user" do
      should have_selector("form")
    end

    it "should have textfield for user email" do
      should have_selector("#user_email")
    end

    it "should have textfield for password" do
      should have_selector("#user_password")
    end

    it "should have textfield for password confirmation" do
      should have_selector("#user_password_confirmation")
    end

    it "should have submit button for user" do
      should have_selector(".submit")
    end
  end
end