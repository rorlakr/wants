# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    user nil
    job_status "MyString"
    job_status_etc "MyString"
    dev_languages "MyString"
    dev_duration "MyString"
    dev_web false
    dev_system false
    dev_smart false
    dev_history "MyText"
    community_activity "MyText"
    book_author "MyText"
    book_trans "MyText"
  end
end
