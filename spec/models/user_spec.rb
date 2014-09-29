require 'spec_helper'

describe User do
  let(:user) { User.new }

  it "should be an ActiveRecord::Base child" do
    expect(User.superclass).to eq(ActiveRecord::Base)
  end

  it "should have :username attribute" do
    user.username = "someuser"
    expect(user.username).to eq("someuser")
  end

  describe "validation for uniqueness of username" do
    before(:each) do
      @user = User.create(FactoryGirl.attributes_for(:user))
      user_with_same_email = @user.dup
      user_with_same_email.username = @user.username
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  it "should have :email attribute" do
    user.email = "some@email.com"
    expect(user.email).to eq("some@email.com")
  end

  describe "validation for uniqueness of email" do
    before(:each) do
      @user = User.create(FactoryGirl.attributes_for(:user))
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  it "should have :password attribute" do
    user.password = "somepass"
    expect(user.password).to eq("somepass")
  end

  it "should have :password_confirmation attribute" do
    user.password_confirmation = "somepass"
    expect(user.password_confirmation).to eq("somepass")
  end
end