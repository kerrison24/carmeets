require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def setup
    @event = Event.new(title: "Pulsar Meetup", location:"Melbourne",
                       description:"First pulsar meet in Melbourne", happens_at: "2014-12-03 03:53:00 UTC")
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "title should be present" do
    @event.title = "    "
    assert_not @event.valid?
  end

  test "date and time should be present" do
    @event.happens_at = nil
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

  test "location should be not be too long" do
    @event.location = "a"*101
    assert_not @event.valid?
  end
end
