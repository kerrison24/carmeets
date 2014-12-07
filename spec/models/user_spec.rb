require 'spec_helper'

describe User do
  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "name is not present" do
    before { @user.name = nil }
    it { should_not be_valid }
  end

  describe "email is not present" do
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

  describe "email format is valid" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      before { @user.email = valid_address }
      it { should be_valid }
    end
  end

  describe "email format is invalid" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com, foo@bar..com]
    invalid_addresses.each do |invalid_address|
      before { @user.email = invalid_address }
      it { should_not be_valid }
    end
  end

  describe "email is already taken" do
    before do
      @user.save
      @user_with_same_email = @user.dup
      @user_with_same_email.email = @user.email.upcase
      @user_with_same_email.save
    end

    it { @user_with_same_email.should_not be_valid }
  end

  describe "password is too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should_not be_valid }
  end

  describe "email should be saved as lowercase" do
    let(:mixed_email_case) { "eMail@EmaIl.cOm" }
    before do
      @user.email = mixed_email_case
      @user.save
    end
    it { @user.email.should eq(mixed_email_case.downcase) }
  end
end
