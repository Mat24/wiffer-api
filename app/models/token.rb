class Token < ActiveRecord::Base

  # Relaciones con otros modelos
  belongs_to :user

  def generate_token
    begin
      self.token= SecureRandom.hex(25)
    end while Token.where(token: self.token).any?
  end

end
