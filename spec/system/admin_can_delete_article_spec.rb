require 'rails_helper'

RSpec.describe 'Admin can delete article', type: :system do
  it 'allows admin to delete an article' do
    login_as_admin

    article = create(:article)

    visit admin_article_path(article)
    click_button 'Delete'

    expect(page).to have_content("Article was successfully destroyed.")
    expect(Article.exists?(article.id)).to be_falsey
  end
end
