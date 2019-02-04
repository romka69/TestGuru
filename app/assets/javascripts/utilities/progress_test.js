document.addEventListener('turbolinks:load', function () {
  var progress = document.querySelector('.progress');
  var progress_bar = document.querySelector('.progress-bar');

  if (progress && progress_bar) {
    var question = progress.dataset.currentQuestion;
    var questions = progress.dataset.allQuestions;

    progress_bar.style.width = question / questions * 100 + '%';
  }
});
