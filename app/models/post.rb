# class PostValidator < ActiveModel::Validator
#   def validate(post)
#     unless post.title.include? "Won't"|| 'Believe' || 'Secret' || 'Top' || 'Guess'
#       post.errors[:post] << "Not clickbaity enough!"
#     end
#   end
# end


# class PostValidator < ActiveModel::EachValidator
#   def validate_each(record, post, title)
#     unless title.include? "Won't"|| 'Believe' || 'Secret' || 'Top' || 'Guess'
#       record.errors[:post] << (options[:message] || "Not Clickbaity Enough!")
#     end
#   end
# end

class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    if self.title
      if !self.title.include?("Won't" || 'Believe' || 'Secret' || 'Top' || 'Guess')
        errors.add(:title, "not clickbait-y enough")
      end
    end
  end

end
