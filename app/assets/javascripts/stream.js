jQuery(document).ready(function() {
  console.log("Here");
  setTimeout(function() {
    console.log("In Timeout");

    var source = new EventSource('/update');

    source.addEventListener('refresh', function() {
      console.log("Reloading");
      window.location.reload();
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

  }, 1);
});
