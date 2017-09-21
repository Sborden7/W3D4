# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :string
#  poll_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :question, presence: true

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: "AnswerChoice"

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: "Poll"

  has_many :responses,
    through: :answer_choices,
    source: :responses


  def results

    AnswerChoice
    .select('answer_choices.*, COUNT(responses.id)')
    .from(:answer_choices)
    .joins(:responses)
    .where('answer_choices.question_id = 12')
    .group('answer_choices.answer')
    # answers = self.answer_choices.includes(:responses)
    # result = Hash.new(0)
    # answers.each do |answer|
    #   result[answer.answer] = answer.responses.count
    # end
    # result
    # Question.execute(<<-SQL, self.id)
    #   SELECT
    #     answer_choices.*, COUNT(*)
    #   FROM
    #     answer_choices
    #   JOIN
    #     responses ON answer_choices.id = responses.response_id
    #   WHERE
    #     answer_choices.question_id = ?
    #   GROUP BY
    #     answer_choices.id
    # SQL
  end
end
