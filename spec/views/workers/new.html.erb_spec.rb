require 'rails_helper'

RSpec.describe "workers/new", :type => :view do
  before(:each) do
    assign(:worker, Worker.new(
      :title => "MyString",
      :content => "MyText",
      :user => nil,
      :salary_requirement => "MyString",
      :job_status => "MyString",
      :job_status_etc => "MyString",
      :dev_languages => "MyString",
      :dev_duration => "MyString",
      :dev_web => false,
      :dev_system => false,
      :dev_smart => false,
      :dev_history => "MyText",
      :community_activity => "MyText",
      :book_author => "MyText",
      :book_trans => "MyText"
    ))
  end

  it "renders new worker form" do
    render

    assert_select "form[action=?][method=?]", workers_path, "post" do

      assert_select "input#worker_title[name=?]", "worker[title]"

      assert_select "textarea#worker_content[name=?]", "worker[content]"

      assert_select "input#worker_user_id[name=?]", "worker[user_id]"

      assert_select "input#worker_salary_requirement[name=?]", "worker[salary_requirement]"

      assert_select "input#worker_job_status[name=?]", "worker[job_status]"

      assert_select "input#worker_job_status_etc[name=?]", "worker[job_status_etc]"

      assert_select "input#worker_dev_languages[name=?]", "worker[dev_languages]"

      assert_select "input#worker_dev_duration[name=?]", "worker[dev_duration]"

      assert_select "input#worker_dev_web[name=?]", "worker[dev_web]"

      assert_select "input#worker_dev_system[name=?]", "worker[dev_system]"

      assert_select "input#worker_dev_smart[name=?]", "worker[dev_smart]"

      assert_select "textarea#worker_dev_history[name=?]", "worker[dev_history]"

      assert_select "textarea#worker_community_activity[name=?]", "worker[community_activity]"

      assert_select "textarea#worker_book_author[name=?]", "worker[book_author]"

      assert_select "textarea#worker_book_trans[name=?]", "worker[book_trans]"
    end
  end
end
