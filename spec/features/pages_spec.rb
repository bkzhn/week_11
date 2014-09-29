require 'spec_helper'

#~ describe "Pages" do
	#~ subject { page }
#~ 
	#~ describe "Home page" do
		#~ before { visit root_path }
#~ 
		#~ it "should have Library App title" do
			#~ should have_selector("title", :text => "Library App")
		#~ end
		#~ 
		#~ it "should have Library App in header" do
			#~ should have_selector("h1", :text => "Library App")
		#~ end
#~ 
		#~ it "link 'Library App' (h1) in header has to redirect to Home page" do
			#~ find_link("Library App")[:href].should eq(root_path)
			#~ click_link("Library App")
			#~ expect(current_path).to eq(root_path)
		#~ end
#~ 
		#~ it "should have link 'Home' in main menu" do
			#~ should have_selector(".main-menu a", :text => "Home")
		#~ end
#~ 
		#~ it "should have link 'About' in main menu" do
			#~ should have_selector(".main-menu a", :text => "About")
		#~ end
#~ 
		#~ it "link 'Home' in main menu has to redirect to Home page" do
			#~ find_link("Home")[:href].should eq(root_path)
			#~ click_link("Home")
			#~ expect(current_path).to eq(root_path)
		#~ end
#~ 
		#~ it "link 'About' in main menu has to redirect to About page" do
			#~ find_link("About")[:href].should eq(about_path)
			#~ click_link("About")
			#~ expect(current_path).to eq(about_path)
		#~ end
		#~ 
		#~ it "should have 'Welcome!' text" do
			#~ should have_selector(".welcome-text", :text => "Welcome!")
		#~ end
	#~ end
#~ 
#~ 
	#~ describe "About page" do
		#~ before { visit about_path }
#~ 
		#~ it "should have Library App title" do
			#~ should have_selector("title", :text => "Library App | About")
		#~ end
		#~ 
		#~ it "should have Library App in header" do
			#~ should have_selector("h1", :text => "Library App")
		#~ end
#~ 
		#~ it "link 'Library App' (h1) in header has to redirect to Home page" do
			#~ find_link("Library App")[:href].should eq(root_path)
			#~ click_link("Library App")
			#~ expect(current_path).to eq(root_path)
		#~ end
#~ 
		#~ it "should have link 'Home' in main menu" do
			#~ should have_selector(".main-menu a", :text => "Home")
		#~ end
#~ 
		#~ it "should have link 'About' in main menu" do
			#~ should have_selector(".main-menu a", :text => "About")
		#~ end
#~ 
		#~ it "link 'Home' in main menu has to redirect to Home page" do
			#~ click_link("Home")
			#~ expect(current_path).to eq(root_path)
		#~ end
#~ 
		#~ it "link 'About' in main menu has to redirect to About page" do
			#~ click_link("About")
			#~ expect(current_path).to eq(about_path)
		#~ end
	#~ end
#~ end
