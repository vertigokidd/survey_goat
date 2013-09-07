class User < ActiveRecord::Base
  has_many :surveys
  has_many :questions, through: :survey

  validates :email, uniqueness: true
  validates :password, length: { minimum: 4 }

  include BCrypt 

  def password
    @password = Password.new(self.password_digest)
  end

  def password=(secret)
    @password = Password.create(secret)
    self.password_digest = @password
  end
end
