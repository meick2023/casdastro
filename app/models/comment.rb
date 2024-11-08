class Comment < ApplicationRecord
#  belongs_to :article
# belongs_to :user
#  belongs_to :post
#end
include Visible

belongs_to :article
belongs_to :user
end
