feature 'sign in' do
  scenario 'user can sign in and see a welcome message' do
    sign_up

    visit '/sessions/new'

    expect(page.status_code).to eq 200

    fill_in 'email', with: 'mememe@not_a_url.com'
    fill_in 'password', with: 'worldsbestpassword'
    click_button 'Sign In'

    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome, mememe@not_a_url.com'
  end
end
