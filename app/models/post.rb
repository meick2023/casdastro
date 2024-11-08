class Post < ApplicationRecord
  # Associações
  belongs_to :user
  has_many :comments, dependent: :destroy

end
