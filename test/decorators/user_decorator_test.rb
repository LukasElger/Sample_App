require 'test_helper'

class UserDecoratorTest < Draper::TestCase

  test "should response with human Date" do
    @user = FactoryBot.build(:user, name: "Test", email: "Testing@Mail.com",
                              created_at: Time.new(2018,12,18,10,10)).decorate
    assert_equal "18.12.2018", @user.human_date(@user.model.created_at)
  end

  test "should response with human Date and text" do
    @user = FactoryBot.build(:user, name: "Test", email: "Testing@Mail.com",
                              created_at: Time.new(2018,12,18,10,10)).decorate
    assert_equal "Es ist der: 18.12.2018", @user.human_date(@user.model.created_at, "Es ist der:")
  end

end
