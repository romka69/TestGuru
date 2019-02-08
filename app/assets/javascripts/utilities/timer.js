document.addEventListener('turbolinks:load', function () {
  var timer = document.querySelector('.timer');

  if (timer) {
    var time_counter = timer.dataset.timer;
    var test_passage_id = timer.dataset.id;

    setInterval(function () {
      if (time_counter > 0) {
          time_counter -= 1;
      } else {
        alert('Time is over');
        document.querySelector('form').submit();
      }

      var time_left = parseInt(time_counter / 60) + ':' + time_counter % 60;
      timer.innerHTML = time_left;

    }, 1000);
  }
});
