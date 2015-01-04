# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :engage do
    engageable nil
    user nil
    shared_profile false
    content "MyText"
  end
end
