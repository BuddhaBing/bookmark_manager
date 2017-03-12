def sign_up(email: 'mememe@not_a_url.com', password: 'worldsbestpassword', password_confirmation: 'worldsbestpassword')
    visit '/users/new'
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation
    click_button 'submit'
end

def sign_in
    visit '/sessions/new'
    fill_in 'email', with: 'mememe@not_a_url.com'
    fill_in 'password', with: 'worldsbestpassword'
    click_button 'Sign In'
end

def recover_password
  visit '/users/recover'
  fill_in :email, with: "mememe@not_a_url.com"
  click_button "Submit"
end
