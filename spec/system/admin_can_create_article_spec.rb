require 'rails_helper'

RSpec.describe 'Admin can create article', type: :system, js: true do
  it 'allows admin to create an article' do
    login_as_admin

    visit new_admin_article_path

    fill_in 'Article Title', with: 'Test Title'
    fill_in 'Content / Description', with: 'Test description'

    click_button 'Save Article'

    expect(page).to have_content('Article was successfully created.')

    expect(page).to have_content('Test Title')
    expect(page).to have_content('Test description')
  end
end
