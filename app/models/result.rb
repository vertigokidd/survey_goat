class Result < ActiveRecord::Base
  belongs_to :answer
  has_one :question, through: :answer
end
