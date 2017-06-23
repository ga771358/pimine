class Userpost < ApplicationRecord
    has_many :userpost_postships
    has_many :posts, :through => :userpost_postships
end
