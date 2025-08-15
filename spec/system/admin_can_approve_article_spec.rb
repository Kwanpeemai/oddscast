require 'rails_helper'

RSpec.describe 'Admin can approve article', type: :system do
  it 'allows admin to approve an article' do
    login_as_admin

    # Create an article in waiting for review status
    article = create(:article, :waiting_for_review)

    visit waiting_admin_article_path(article) # หรือหน้า approve ถ้าต้องการ

    expect(page).to have_button('Approve')
    expect(page).to have_button('Reject')
    sleep 2
    click_button 'Approve'
    expect(page).to have_content('Article approved.')
    expect(page).to have_content('Published')
  end
end
