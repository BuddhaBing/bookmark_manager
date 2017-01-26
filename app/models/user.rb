require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include  DataMapper::Resource

  property :id, Serial
  property :email, String, required: true
  property :password_digest, Text
  validates_confirmation_of :password
  validates_presence_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
