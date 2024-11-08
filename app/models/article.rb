# class Article < ApplicationRecord
#   has_many :comments

#   validates :title, presence: true
#   validates :body, presence: true, length: { minimum: 10 }
# end

class Article < ApplicationRecord
  include Visible
  
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :status, inclusion: { in: ['public', 'private', 'archived'] }
  
  def self.public_count
    where(status: 'public').count
  end
end
#module Visible
#  extend ActiveSupport::Concern

#  included do
#    scope :public, -> { where(status: 'public') }
#    scope :archived, -> { where(status: 'archived') }
#  end

  # Método para contar artigos públicos
#  class_methods do
#    def public_count
#      public.count
#    end
#  end
#end


  