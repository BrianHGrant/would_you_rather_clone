require "rails_helper"

describe "the add a question path" do
  it "will allow a user to add a question" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.build(:question)
    login_as(user, :scope => :user)
    visit '/'
    click_on 'Ask'
    fill_in 'A answer', :with => question.a_answer
    fill_in 'B answer', :with => question.b_answer
    click_on 'Create Question'
    expect(page).to have_content('Go to France')
  end
end
