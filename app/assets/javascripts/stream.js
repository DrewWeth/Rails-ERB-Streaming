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

    source.addEventListener('notification', function(e) {
      var data = JSON.parse(e["data"]);

      console.log(data);
      var alert = '<div class="alert alert-warning alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Hey! </strong>'+ data["data"] + '</div>';
      $('#main').append(alert);

    });

    source.addEventListener('open', function() {
      console.log("Connected");
    });

    source.addEventListener('error', function() {
      console.log("Connected");
    });

  }, 1);
});
