require 'rails_helper'

RSpec.describe "workers/index", :type => :view do
  before(:each) do
    assign(:workers, [
      Worker.create!(
        :title => "Title",
        :content => "MyText",
        :user => nil,
        :salary_requirement => "Salary Requirement",
        :job_status => "Job Status",
        :job_status_etc => "Job Status Etc",
        :dev_languages => "Dev Languages",
        :dev_duration => "Dev Duration",
        :dev_web => false,
        :dev_system => false,
        :dev_smart => false,
        :dev_history => "MyText",
        :community_activity => "MyText",
        :book_author => "MyText",
        :book_trans => "MyText"
      ),
      Worker.create!(
        :title => "Title",
        :content => "MyText",
        :user => nil,
        :salary_requirement => "Salary Requirement",
        :job_status => "Job Status",
        :job_status_etc => "Job Status Etc",
        :dev_languages => "Dev Languages",
        :dev_duration => "Dev Duration",
        :dev_web => false,
        :dev_system => false,
        :dev_smart => false,
        :dev_history => "MyText",
        :community_activity => "MyText",
        :book_author => "MyText",
        :book_trans => "MyText"
      )
    ])
  end

  it "renders a list of workers" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Salary Requirement".to_s, :count => 2
    assert_select "tr>td", :text => "Job Status".to_s, :count => 2
    assert_select "tr>td", :text => "Job Status Etc".to_s, :count => 2
    assert_select "tr>td", :text => "Dev Languages".to_s, :count => 2
    assert_select "tr>td", :text => "Dev Duration".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
