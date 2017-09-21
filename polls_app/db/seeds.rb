# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all


users = User.create([{username: 'Seth'}, {username: 'Mike'}, {username: 'Bob'}])

Poll.destroy_all


poll1 = Poll.create(title: 'Pizza?', user_id: users.first.id )
poll2 = Poll.create(title: 'Assessments', user_id: users.last.id)

Question.destroy_all


q1 = Question.create(question: 'Do you like $1 pizza?', poll_id: poll1.id)
q2 = Question.create(question: 'Will you miss $1 pizza when we move offices?', poll_id: poll1.id)
q3 = Question.create(question: 'Will you pass assessment 3?', poll_id: poll2.id)
q4 = Question.create(question: 'What is your backup plan if you fail?', poll_id: poll2.id)

AnswerChoice.destroy_all


a1 = AnswerChoice.create(answer: 'Yes', question_id: q1.id)
a2 = AnswerChoice.create(answer: 'No', question_id: q1.id)
a3 = AnswerChoice.create(answer: 'Yes', question_id: q2.id)
a4 = AnswerChoice.create(answer: 'No', question_id: q2.id)
a5 = AnswerChoice.create(answer: 'Yes', question_id: q3.id)
a6 = AnswerChoice.create(answer: 'No', question_id: q3.id)
a7 = AnswerChoice.create(answer: 'Return to your old line of work.', question_id: q4.id)
a8 = AnswerChoice.create(answer: 'Go back to college.', question_id: q4.id)
a9 = AnswerChoice.create(answer: 'Give up and cry.', question_id: q4.id)

Response.destroy_all


Response.create(user_id: users.first.id, response_id: a9.id)
Response.create(user_id: users.first.id, response_id: a5.id)
Response.create(user_id: users[1].id, response_id: a7.id)
Response.create(user_id: users[1].id, response_id: a1.id)
Response.create(user_id: users.last.id, response_id: a6.id)
Response.create(user_id: users.last.id, response_id: a9.id)
