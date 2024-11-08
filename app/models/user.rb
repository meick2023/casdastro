class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # Inclua os módulos padrão do Devise. Outros disponíveis são:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Associações
  has_many :posts
  has_many :comments
  has_secure_password
  validates :username, presence: true, uniqueness: true
end
