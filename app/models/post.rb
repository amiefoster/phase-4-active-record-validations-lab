class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :check_title

    CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ] 

    def check_title
        if CLICKBAIT_PATTERNS.none? do |clickbait| 
          clickbait.match title 
        end
        errors.add(:title, "must be clickbait")
        end
    end
end
