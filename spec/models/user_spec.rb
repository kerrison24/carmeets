require 'spec_helper'

describe User do
  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = nil }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = nil }
    it { should_not be_valid }
  end

  describe "name should not be too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "email should not be too long" do
    before { @user.email = "a" * 256 }
    it { should_not be_valid }
  end

  describe "when email format is valid" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      before { @user.email = valid_address }
      it { should be_valid }
    end
  end

  describe "when email format is invalid" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      before { @user.email = invalid_address }
      it { should_not be_valid }
    end
  end

  describe "when email is already taken" do
    before do
      @user.save
      @user_with_same_email = @user.dup
      @user_with_same_email.email = @user.email.upcase
      @user_with_same_email.save
    end

    it { @user_with_same_email.should_not be_valid }
  end
end
