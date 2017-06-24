class Post < ApplicationRecord
    has_many :userpost_postships
    has_many :userposts, :through => :userpost_postships

    # validates :user_id, presence: true
    # validates :title, presence: true
    # validates :itype, presence: true
    # validates :price, presence: true
    # validates :tclick, presence: true
    # validates :location, presence: true
    # validates :content, presence: true
    # validates :is_sold, presence: true


    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


end
