require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class TestGuest < MiniTest::Test

  def setup()
    @guest1 = Guest.new("Bob")
  end

  def test_if_guest_has_name
    assert_equal("Bob", @guest1.guest_name)
  end


end
