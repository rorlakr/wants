# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    company "MyString"
    intro "MyString"
    from "2014-12-31"
    to "2014-12-31"
    always false
    contact "MyString"
    user nil
  end
end
