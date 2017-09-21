# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  answer      :string
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswerChoice < ApplicationRecord
  validates :answer, presence: true

  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: "Question"

  has_many :responses,
    primary_key: :id,
    foreign_key: :response_id,
    class_name: "Response"


end
