require "test_helper"
class UserTest < ActiveSupport::TestCase

  def setup
   @user = users(:one)
  end

  test 'valid user' do
    assert @user.valid?
  end  
end
