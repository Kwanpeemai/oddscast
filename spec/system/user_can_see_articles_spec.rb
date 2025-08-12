require 'rails_helper'

describe 'User can see articles' do
  before do
    create(:article)
  end
  it 'displays article on the page' do
    visit root_path
    expect(page).to have_content("test")
  end
end