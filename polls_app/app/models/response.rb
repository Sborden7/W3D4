# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  response_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Response < ApplicationRecord
  validates :user_id, presence: true
  validates :response_id, presence: true
  validate :respondent_already_answered?

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :response_id,
    class_name: "AnswerChoice"

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  has_one :question,
    through: :answer_choice,
    source: :question


  def sibling_responses
    self.question.responses.where.not(responses: {id: self.id})
  end

  def respondent_already_answered?
    errors[:user_id] << "Already answered" if self.sibling_responses.exists?(user_id: self.user_id)

  end
end
