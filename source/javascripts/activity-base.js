$(function () {
  //map表示
  var latlng = new google.maps.LatLng(34.802876, 135.771218);
  var options = {
      zoom: 17,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      streetViewControl: false,
      scrollwheel: false
  };
  var map = new google.maps.Map(document.getElementById('map'), options);

  //マーカーの表示
  var marker = new google.maps.Marker({
    position: map.getCenter(),
    title: 'ローム記念館',
    map:map
  });
});
