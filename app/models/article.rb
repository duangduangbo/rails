class Article < ApplicationRecord
    has_many :comments,dependent: :destroy
    validates :title,presence:true,length: {minimum: 5 }
    validates :remember_me, acceptance: true
    
end
