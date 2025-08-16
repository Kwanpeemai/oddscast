require 'rails_helper'

RSpec.describe 'Admin can approve article', type: :system do
    it 'allows admin to approve an article' do
      login_as_admin

      article = create(:article, :waiting_for_review)

      visit waiting_admin_article_path(article)

      expect(page).to have_button('Approve')
      expect(page).to have_button('Reject')
      sleep 2
      click_button 'Approve'
      expect(page).to have_link('Edit')
      expect(page).to have_link('Back to Articles')
    end
end
