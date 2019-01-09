# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

derp, bob = User.create!(
  [{ name: "Derp", email: "derp@mail.com" }, { name: "Bob", email: "bob@mail.com" }]
)

backend, frontend = Category.create!(
  [{ title: "Backend" }, { title: "Frontend" }]
)

ruby = Test.create!(title: "Ruby", level: 1, category_id: backend.id, author_id: bob.id)
python = Test.create!(title: "Python", level: 2, category_id: backend.id, author_id: bob.id)
html = Test.create!(title: "HTML", level: 0, category_id: frontend.id, author_id: bob.id)
css = Test.create!(title: "CSS", level: 0, category_id: frontend.id, author_id: bob.id)

questions = Question.create!(
  [{ body: "Which command can download the library?", test_id: ruby.id },
   { body: "Is it a scripting language?", test_id: python.id },
   { body: "Was this language derived from XML?", test_id: html.id },
   { body: "Is it a language that describes the look and feel of web pages?", test_id: css.id }]
)

answers = Answer.create!(
  [{ body: "Correct answer to Ruby", correct: true, question_id: questions[0].id },
   { body: "Incorrect answer to Ruby", correct: false, question_id: questions[0].id },
   { body: "Correct answer to Python", correct: true, question_id: questions[1].id },
   { body: "Incorrect answer to Python", correct: false, question_id: questions[1].id },
   { body: "Correct answer to HTML", correct: true, question_id: questions[2].id },
   { body: "Incorrect answer to HTML", correct: false, question_id: questions[2].id },
   { body: "Correct answer to CSS", correct: true, question_id: questions[3].id },
   { body: "Incorrect answer to CSS", correct: false, question_id: questions[3].id }]
)

results = Result.create!(
  [{ user: derp, test: ruby },
   { user: derp, test: html }]
)
