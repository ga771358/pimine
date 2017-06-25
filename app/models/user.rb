class User < ApplicationRecord
    has_many :posts
    has_many :userposts

    validates :name, presence: true
    validates :sid, presence: true
    validates :email, presence: true
    validates :tnum, presence: true
    validates :score, presence: true
    validates_uniqueness_of :email
    validates_uniqueness_of :sid

end
