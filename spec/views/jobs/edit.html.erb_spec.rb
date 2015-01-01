require 'rails_helper'

RSpec.describe "jobs/edit", :type => :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :company => "MyString",
      :intro => "MyString",
      :always => false,
      :contact => "MyString",
      :user => nil
    ))
  end

  it "renders the edit job form" do
    render

    assert_select "form[action=?][method=?]", job_path(@job), "post" do

      assert_select "input#job_company[name=?]", "job[company]"

      assert_select "input#job_intro[name=?]", "job[intro]"

      assert_select "input#job_always[name=?]", "job[always]"

      assert_select "input#job_contact[name=?]", "job[contact]"

      assert_select "input#job_user_id[name=?]", "job[user_id]"
    end
  end
end
