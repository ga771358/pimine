class Userpost < ApplicationRecord
    belongs_to :user
    has_many :userpost_postships
    has_many :posts, :through => :userpost_postships
end
