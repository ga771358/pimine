class Post < ApplicationRecord
    has_many :userpost_postships
    has_many :userposts, :through => :userpost_postships

    validates :user_id, presence: true
    validates :title, presence: true
    validates :itype, presence: true
    validates :price, presence: true
    validates :tclick, presence: true
    validates :location, presence: true
    validates :content, presence: true
    validates :is_sold, presence: true

end
