class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :answers, through: :question

  mount_uploader :file, Uploader

  def formatted_date
    created_at.strftime('%a %d %b %Y')
  end

  def responses
    questions.first.results.count
  end

end
