class UserpostPostship < ApplicationRecord
    belongs_to :userpost
    belongs_to :post
end
