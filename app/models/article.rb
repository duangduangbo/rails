class Article < ApplicationRecord
    belongs_to :user,counter_cache: :count_of_articles
    has_many :comments,dependent: :destroy
    
    validates :title,presence:true,length: {minimum: 5 }
    validates :remember_me, acceptance: true
    
end
