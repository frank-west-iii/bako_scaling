$(function() {
  var client = new Faye.Client('http://localhost:9292/faye');

  var public_subscription = client.subscribe('/messages/public', function(data) {
    var row = $('#order_' + data.order_id);
    row.before("<div/>")
    row.prev().width(row.width()).height(row.height()).css({
      "position": "absolute",
      "background-color": "#ffff99",
      "opacity": ".9"
    }).fadeOut(500);
    $('#order_' + data.order_id + '_status').html(data.status);
  });
});
