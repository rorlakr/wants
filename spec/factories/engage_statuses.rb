# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :engage_status do
    engage_on nil
    started_status "MyString"
    started_at "2015-01-11 14:22:49"
    expired_at "2015-01-11 14:22:49"
  end
end
