class BookmarkManager < Sinatra::Base
  get '/signup' do
    @user = User.new
    erb :'users/new'
  end

  post '/addnewuser' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id # if the user was able to be saved (met all of the critera set out in the User class), save their ID to the session
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages # if not, show the appropriate error message for whatever was missing and prevented successful signup
      erb :'users/new'
    end
  end

  get '/users/recover' do
    erb :'users/recover'
  end

  post '/users/recover' do
    user = User.first(email: params[:email]) # find the user with the matching email address in the db
    if user
      user.generate_token # generate a password token if the user if found
      SendRecoverLink.call(user) # pass in the user to mailgun so that the details can be extracted and the recovery email sent
    end
    erb :'users/acknowledgement'
  end

  get '/users/reset_password' do
    @user = User.find_by_valid_token(params[:token]) # check whether the password token given by the recovery link is valid and if so, return the user from the db
    if @user
      session[:token] = params[:token] # assign the token from the recovery link, to the session
      erb :'users/reset_password'
    else
      'Your token is invalid' # if the reset password token is invalid, display a message
    end
  end

  patch '/users' do
    user = User.find_by_valid_token(session[:token]) # check whether the password token stored in the session (from above) is valid and if so, return the user from the db
    if user.update(password: params[:password], password_confirmation: params[:password_confirmation]) # update the user's password and password_confirmation to the new password given
      session[:token] = nil # now it has been used, set the password_token in the session to nil
      user.update(password_token: nil) # now it has been used, set the password_token in the db to nil
      redirect '/sessions/new'
    else
      flash.now[:errors] = user.errors.full_messages # display an error if the password update is not successful
      erb :'users/reset_password'
    end
  end
end
