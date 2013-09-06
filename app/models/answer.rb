class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :results

  def find_percentage
    answer_results = results.count
    total_results = question.results.count
    ((answer_results.to_f / total_results) * 100).round
  end

  def find_total
    results.count
  end
end
