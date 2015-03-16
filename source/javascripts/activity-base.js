//activityBase.js
$(function () {

  // onload, onresize時にmapサイズを変更
  $(window).on('load resize', function() {
    // 画面の表示領域を取得
    var wW = $(window).innerWidth();
    // cssに反映
    $('#map').css('width', wW+'px');
  });

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
