require 'rails_helper'

RSpec.describe "jobs/new", :type => :view do
  before(:each) do
    assign(:job, Job.new(
      :company => "MyString",
      :intro => "MyString",
      :always => false,
      :contact => "MyString",
      :user => nil
    ))
  end

  it "renders new job form" do
    render

    assert_select "form[action=?][method=?]", jobs_path, "post" do

      assert_select "input#job_company[name=?]", "job[company]"

      assert_select "input#job_intro[name=?]", "job[intro]"

      assert_select "input#job_always[name=?]", "job[always]"

      assert_select "input#job_contact[name=?]", "job[contact]"

      assert_select "input#job_user_id[name=?]", "job[user_id]"
    end
  end
end
