require 'rails_helper'

RSpec.describe "workers/show", :type => :view do
  before(:each) do
    @worker = assign(:worker, Worker.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Salary Requirement/)
    expect(rendered).to match(/Job Status/)
    expect(rendered).to match(/Job Status Etc/)
    expect(rendered).to match(/Dev Languages/)
    expect(rendered).to match(/Dev Duration/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
