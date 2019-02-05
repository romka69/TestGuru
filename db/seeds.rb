movie, geography = Category.create!(
  [{ title: "Кино" }, { title: "География" }]
)

st = Test.create!(title: "Звездные Войны", level: 0, category_id: movie.id, author_id: User.first.id)
jb = Test.create!(title: "Джеймс Бонд", level: 1, category_id: movie.id, author_id: User.first.id)
ru = Test.create!(title: "Россия", level: 3, category_id: geography.id, author_id: User.first.id)
usa = Test.create!(title: "США", level: 4, category_id: geography.id, author_id: User.first.id)

questions = Question.create!(
  [{ body: "Прошлое имя Дарта Вейдера?", test_id: st.id },
   { body: "Как звали сестру Люка Скайуокера?", test_id: st.id },
   { body: "Кто такие ситхи?", test_id: st.id },
   { body: "Сколько оффициальных фильмов снято на текущий момент?", test_id: jb.id },
   { body: "Как теперь называется остров в Тайланде, где проходили съемки фильма?", test_id: jb.id },
   { body: "Столица России?", test_id: ru.id },
   { body: "Где проходила олимпиада 2014?", test_id: ru.id },
   { body: "Столица США?", test_id: usa.id },
   { body: "Где пройдет олимпиада 2028?", test_id: usa.id }]
)

answers = Answer.create!(
  [{ body: "Энакин Скайуокер", correct: true, question_id: questions[0].id },
   { body: "Джа-Джа Бинкс", correct: false, question_id: questions[0].id },
   { body: "Хан Соло", correct: false, question_id: questions[0].id },
   { body: "Палпатина", correct: false, question_id: questions[1].id },
   { body: "Лея Органа", correct: true, question_id: questions[1].id },
   { body: "Адепты темной стороны", correct: true, question_id: questions[2].id },
   { body: "Адепты светлой стороны", correct: false, question_id: questions[2].id },
   { body: "26 фильмов", correct: true, question_id: questions[3].id },
   { body: "36 фильмов", correct: false, question_id: questions[3].id },
   { body: "Остров Май Тай", correct: false, question_id: questions[4].id },
   { body: "Остров Джеймс Бонда ", correct: true , question_id: questions[4].id },
   { body: "Тверь", correct: false, question_id: questions[5].id },
   { body: "Москва", correct: true, question_id: questions[5].id },
   { body: "Сочи", correct: true, question_id: questions[6].id },
   { body: "Тверь", correct: false, question_id: questions[6].id },
   { body: "Нью-Йорк", correct: false, question_id: questions[7].id },
   { body: "Вашингтон", correct: true, question_id: questions[7].id },
   { body: "Сиэтл", correct: false, question_id: questions[8].id },
   { body: "Лос Анжелес", correct: true, question_id: questions[8].id }]
)
