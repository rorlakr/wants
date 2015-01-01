require 'rails_helper'

RSpec.describe "jobs/index", :type => :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        :company => "Company",
        :intro => "Intro",
        :always => false,
        :contact => "Contact",
        :user => nil
      ),
      Job.create!(
        :company => "Company",
        :intro => "Intro",
        :always => false,
        :contact => "Contact",
        :user => nil
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Intro".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
