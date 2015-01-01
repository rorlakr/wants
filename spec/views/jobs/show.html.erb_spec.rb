require 'rails_helper'

RSpec.describe "jobs/show", :type => :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :company => "Company",
      :intro => "Intro",
      :always => false,
      :contact => "Contact",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Intro/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(//)
  end
end
