def signup
  visit '/signup'
  fill_in 'email', with: 'test@hotmail.com'
  fill_in 'password', with: 'password'
  click_button 'sign_up'
end
feature 'user signup' do
  scenario 'enter email and password' do
    expect { signup }.to change(User, :count).by(1)
    expect(page.current_path).to eq '/links'
    expect(page).to have_content 'test@hotmail.com'
  end
end
