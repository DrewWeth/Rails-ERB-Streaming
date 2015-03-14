jQuery(document).ready(function() {
  console.log("Here");
  setTimeout(function() {
    console.log("In Timeout");

    var source = new EventSource('/update');

    source.addEventListener('refresh', function(e) {
      console.log(e);
      $('#sse').append("<div>" + JSON.stringify(e["data"]) + "</div>");
      console.log("Reloading");

      // window.location.reload();
    });

    source.addEventListener('message', function(e) {
      console.log("MESSAGE METHOD:" + e);

      console.log("Connected");
    });

    source.addEventListener('open', function() {
      console.log("Connected");
    });

    source.addEventListener('error', function() {
      console.log("Connected");
    });

  }, 1);
});
