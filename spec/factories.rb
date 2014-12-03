FactoryGirl.define do
  factory :event do |f|
    f.sequence(:title) { |n| "Title#{n}" }
    f.happens_at "2014-12-03 03:53:00 UTC"
    f.description "Test"
    f.location "Melbourne"
  end
end
