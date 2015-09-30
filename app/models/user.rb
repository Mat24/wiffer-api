require 'bcrypt'
class User < ActiveRecord::Base

  # Relaciones con otros modelos
  has_many :tokens
  has_many :networks
  # Modulo de BCrypt para crear contraseñas seguras
  include BCrypt

  # Validaciones de campos existentes y unicos
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true

  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end

  def new_session_token
    new_token = Token.create
    self.tokens << new_token
    new_token.token
  end

end
