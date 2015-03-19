jQuery(document).ready(function() {
  setTimeout(function() {

    var source = new EventSource('/update');

    source.addEventListener('refresh', function(e) {
      console.log(e);
      $('#sse').append("<div>" + JSON.stringify(e["data"]) + "</div>");
      console.log("Reloading");

      // window.location.reload();
    });

    source.addEventListener('message', function(e) {
      var res = JSON.parse(e.data);
      console.log(res);
      var date = new Date();
      $('#bottom').prepend("<p style='background:#"+ res["color"] +"'>" + res["message"] + "<span class='timestamp'>"+ date.getUTCHours() +":"+date.getUTCMinutes() +"</span></p>");
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
