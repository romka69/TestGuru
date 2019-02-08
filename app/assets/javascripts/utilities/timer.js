document.addEventListener('turbolinks:load', function () {
  var timer = document.querySelector('.timer');

  if (timer) {
    var timeCounter = timer.dataset.timer;

    setInterval(function () {
      if (timeCounter > 0) {
          timeCounter -= 1;
      } else {
        alert('Time is over');
        document.getElementById('form_test_passages').submit();
      }

      var timeLeft = parseInt(timeCounter / 60) + ':' + timeCounter % 60;
      timer.innerHTML = timeLeft;

    }, 1000);
  }
});
