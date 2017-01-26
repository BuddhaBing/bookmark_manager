feature 'User sign up' do
  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect { sign_up(email: '') }.not_to change(User, :count)
    expect(page.current_path).to eq '/users'
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end

def sign_up(email: 'test@hotmail.com',
              password: '12345678',
              password_confirmation: '12345678')
  visit '/signup'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'sign_up'
end
