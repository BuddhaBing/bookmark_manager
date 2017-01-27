require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'securerandom'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true # sets the email property to be unique and must be formatted as an email address
  property :password_digest, Text # bcrypt hashed password
  property :password_token, String, length: 60 # password token generated for reset password
  property :password_token_time, Time # timestamp for generated password token

  validates_confirmation_of :password # ensures that password matches password_confirmation
  validates_presence_of :email # ensures that an email address is given
  validates_format_of :email, as: :email_address # ensures that the format of the email address is correct

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password) # uses bcrypt to create a hashed password
  end

  def self.authenticate(email, password)
    user = first(email: email) # find first user in the db that matches the email address
    user if user && BCrypt::Password.new(user.password_digest) == password # checks that the password
  end

  def self.find_by_valid_token(token)
    user = first(password_token: token) # finds the first user in the db that has a token that matches the token in the reset pw link
    user if user && user.password_token_time + (60 * 60) > Time.now # checks if the timestamp is still valid (less than one hour elapsed from when it was generated)
  end

  def generate_token
    self.password_token = SecureRandom.hex # uses securerandom to generate a random token for the password reset process
    self.password_token_time = Time.now # sets the token timestamp to now
    save
  end
end
