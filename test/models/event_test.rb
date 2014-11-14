require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def setup
    @event = Event.new(title: "Pulsar Meetup", date: 20112014, time: 2000, location:"Melbourne",
                       description:"First pulsar meet in Melbourne")
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "title should be present" do
    @event.title = "    "
    assert_not @event.valid?
  end

  test "date should be present" do
    @event.date = nil
    assert_not @event.valid?
  end

  test "time should be present" do
    @event.time = nil
    assert_not @event.valid?
  end

  test "location should be present" do
    @event.location = "    "
    assert_not @event.valid?
  end

  test "description should be present" do
    @event.description = "  "
    assert_not @event.valid?
  end

  test "title should not be too long" do
    @event.title = "a" * 51
    assert_not @event.valid?
  end

  test "date should be 8 digits long" do
    @event.date = 1234567
    assert_not @event.valid?
  end

  test "time should be 4 digits long" do
    @event.time = 123
    assert_not @event.valid?
  end

  test "location should be not be too long" do
    @event.location = "a"*101
    assert_not @event.valid?
  end

  test "time is valid" do
    @event.time = 2401
    assert_not @event.valid?
  end
end
