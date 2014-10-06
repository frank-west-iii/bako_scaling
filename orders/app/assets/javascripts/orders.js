$(function() {
  var client = new Faye.Client('http://localhost:9292/faye');

  var public_subscription = client.subscribe('/messages/public', function(data) {
    $('#order_' + data.order_id + '_status').html(data.status).fadeIn(100).fadeOut(100).fadeIn(100);
  });
});
