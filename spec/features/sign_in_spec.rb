feature 'sign in' do
  scenario 'user can sign in and see a welcome message' do
    User.new(email: 'testuser@test.com', password: 'password')


    visit '/sessions/new'

    expect(page.status_code).to eq 200

    fill_in 'email', with: 'testuser@test.com'
    fill_in 'password', with: 'password'
    click_button 'Sign In'

    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome, testuser@test.com'

  end
end
