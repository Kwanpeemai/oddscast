module AuthHelper
  def login_as_admin
    user = create(:user)

    visit admin_articles_path
    expect(page).to have_current_path(new_session_path)

    fill_in 'Enter your email address', with: user.email_address
    fill_in 'Enter your password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content('Logged in successfully.')
    expect(page).to have_content('Create Article')
    expect(page).to have_content('Sign out')
    user
  end
end
