require 'rails_helper'

describe 'User can see articles', type: :system do
  before do
    create(:article)
  end

  it 'displays article on the page' do
    visit root_path
    expect(page).to have_content("Test Title")
    expect(page).to have_content("Test description")
  end
end
