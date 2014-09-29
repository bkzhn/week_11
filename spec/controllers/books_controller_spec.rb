require 'spec_helper'

describe BooksController do
  it "should be an ApplicationController child" do
    expect(BooksController.superclass).to eq(ApplicationController)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @book = Book.new(FactoryGirl.attributes_for(:book))
      @book.save

      visit book_path(id: @book.id)
    end

    it "returns http success" do
      response.should be_success
    end
  end

  describe "GET 'new'" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      visit root_path
      fill_in "username", with: user.username
      fill_in "password", with: user.password
      click_button "Login"

      visit new_book_path
    end

    it "returns http success" do
      response.should be_success
    end

    # it "assigns @book variable to the new.hml.erb view" do
      # get 'new'
      # expect(assigns[:book]).to be_a_new(Book)
    # end

    it "renders new.html.erb" do
      expect(response).to render_template(:new)
    end
  end

  describe "GET 'create'" do
    it "should not return http success" do
      get 'create'
      response.should_not be_success
    end

    it "assigns a newly created book as @book" do
      post :create, {:book => FactoryGirl.attributes_for(:book)}
      assigns(:book).should be_a(Book)
      assigns(:book).should be_persisted
    end
  end

  describe "GET 'edit'" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      visit root_path
      fill_in "username", with: user.username
      fill_in "password", with: user.password
      click_button "Login"

      @book = Book.new(FactoryGirl.attributes_for(:book))
      @book.user_id = user.id
      @book.save
      # @user = User.new(FactoryGitl.attributes_for(:user))
      # @user.save
      visit edit_book_path(id: @book.id)
    end

    it "returns http success" do
      response.should be_success
    end

    it "renders edit.html.erb" do
      # post new_session, :username => @user.username, :password => 'my_password'

      expect(response).to render_template(:edit)
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @book = Book.new(FactoryGirl.attributes_for(:book))
      @book.save
      @attr = {
          :title => "New Title", :year => 2015,
          :description => "New desctiption",
          :isbn => "978-2-16-148410-0"
      }
      put :update, :id => @book.id, :book => @attr
      @book.reload
    end

    it { @book.title.should eql @attr[:title] }
    it { @book.year.should eql @attr[:year] }
    it { @book.description.should eql @attr[:description] }
    it { @book.isbn.should eql @attr[:isbn] }
  end

  # describe "DELETE 'destroy'" do
  #   let(:user) { FactoryGirl.create(:user) }
  #   before(:each) do
  #     visit root_path
  #     fill_in "username", with: user.username
  #     fill_in "password", with: user.password
  #     click_button "Login"
  #
  #     @book = Book.new(FactoryGirl.attributes_for(:book))
  #     @book.user_id = user.id
  #     @book.save
  #   end
  #
  #   it "should delete a book" do
  #     expect { delete :destroy, :id => @book.id }.to change(Book, :count)
  #   end
  # end

  describe "DELETE 'destroy'" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      @book = Book.new(FactoryGirl.attributes_for(:book))
      @book.user_id = user.id
      @book.save
    end

    it "should delete a book" do
      expect { delete :destroy, :id => @book.id }.not_to change(Book, :count)
    end
  end
end