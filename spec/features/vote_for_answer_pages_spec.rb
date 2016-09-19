require "rails_helper"

describe "the vote for answer path"  do
  it "will allow a user to vote for a question and see voting results", js: true do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    login_as(user, :scope => :user)
    visit '/'
    expect(page).to have_no_content('100')
    first(:button, "Choose").click
    expect(page).to have_content('100')
  end
end
