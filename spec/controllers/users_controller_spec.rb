require 'spec_helper'

describe UsersController do
  it "should be an ApplicationController child" do
    expect(UsersController.superclass).to eq(ApplicationController)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @user = User.new(FactoryGirl.attributes_for(:user))
      @user.save

      visit user_path(id: @user.id)
    end

    it "returns http success" do
      response.should be_success
    end
  end

  describe "GET 'new'" do
    before { visit new_user_path }

    it "assigns @user variable to the new.hml.erb view" do
      get 'new'
      expect(assigns[:user]).to be_a_new(User)
    end

    it "renders new.html.erb" do
      expect(response).to render_template(:new)
    end
  end

  # describe "GET 'create'" do
  #   it "assigns a newly created user as @user" do
  #     post :create, {:user => FactoryGirl.attributes_for(:user)}
  #     assigns(:user).should be_a(User)
  #     assigns(:user).should be_persisted
  #   end
  # end

  describe "GET 'edit'" do
    before(:each) do
      @user = User.new(FactoryGirl.attributes_for(:user))
      @user.save

      visit root_path
      fill_in "username", with: @user.username
      fill_in "password", with: @user.password
      click_button "Login"

      visit edit_user_path(id: @user.id)
    end

    it "returns http success" do
      response.should be_success
    end

    it "renders edit.html.erb" do
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @user = User.new(FactoryGirl.attributes_for(:user))
      @user.save
      @attr = {
          :username => "someuser",
          :email => "some@email.com",
          :password => "somepass",
          :password_confirmation => "somepass"
      }
      put :update, :id => @user.id, :user => @attr
      @user.reload
    end

    it { @user.username.should eql @attr[:username] }
    it { @user.email.should eql @attr[:email] }
  end
end