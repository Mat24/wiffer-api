class Token < ActiveRecord::Base

  before_create :generate_token

  # Relaciones con otros modelos
  belongs_to :user

  def generate_token
    begin
      self.token= SecureRandom.hex(25)
    end while Token.where(token: self.token).any?
  end

end
