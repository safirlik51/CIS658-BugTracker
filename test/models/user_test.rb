require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.create({:fname => 'Spencer', :lname => 'Firlik', :email => 'sf@mail.com', :thumbnail => 'profile.png'})
  end

  test "user must be valid" do
  	assert @user.valid?
  end

  test "First name must not be blank" do
  	@user.fname = ""
  	assert_not @user.valid?
  end

  test "Last name must not be blank" do
  	@user.lname = ""
  	assert_not @user.valid?
  end

  test "email must not be blank" do
  	@user.email = ""
  	assert_not @user.valid?
  end

  test "email must be unqiue" do
  	duplicateemail = User.new({:fname => 'Super', :lname => 'Fantastic', :email => @user.email, :thumbnail => 'profile.png'})
  end

  test "email must be valid" do
  	@user.email = "ruby.net"
  	assert_not @user.valid?
  end

  test "thumbnail must end in proper format" do
  	@user.thumbnail = "finaltest.pdf"
  	assert_not @user.valid?
  end

end
