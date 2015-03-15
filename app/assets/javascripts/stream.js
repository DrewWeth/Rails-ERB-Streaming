jQuery(document).ready(function() {
  console.log("Here");
  setTimeout(function() {
    console.log("In Timeout");

    var source = new EventSource('/update');

    source.addEventListener('refresh', function() {
      console.log("Reloading");
      window.location.reload();
    });

    source.addEventListener('open', function() {
      console.log("Connected");

    });

  }, 1);
});
