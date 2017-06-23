class Post < ApplicationRecord
    has_many :userpost_postships
    has_many :userposts, :through => :userpost_postships
end
