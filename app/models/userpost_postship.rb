class UserpostPostship < ApplicationRecord
    belongs_to :userpost,:dependent => :destroy
    belongs_to :post
end
