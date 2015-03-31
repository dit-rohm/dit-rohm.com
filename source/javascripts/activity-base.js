$(function () {
  //map表示
  var latlng = new google.maps.LatLng(34.802760, 135.771273);
  var options = {
      zoom: 16,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      scrollwheel: false
  };
  var map = new google.maps.Map(document.getElementById('map'), options);
  var styles =
    [{"featureType":"landscape","stylers":[{"saturation":-100},{"lightness":65},{"visibility":"on"}]},{"featureType":"poi","stylers":[{"saturation":-100},{"lightness":51},{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"road.arterial","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"on"}]},{"featureType":"road.local","stylers":[{"saturation":-100},{"lightness":40},{"visibility":"on"}]},{"featureType":"transit","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"administrative.province","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":-25},{"saturation":-100}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":-25},{"saturation":-97}]}];
  map.setOptions({styles: styles});

  //マーカーの表示
  var marker = new google.maps.Marker({
    position: map.getCenter(),
    title: 'ローム記念館',
    map:map
  });
/*
  $('.header-content h1').velocity(
    {
      translateY: '+=200px'
    }, {
      duration: 500,
      easing: 'ease-in-out',
      loop: 1,
      delay: 500
    }
  );
  */
 /*
 $('.more').velocity(
    {
      translateY: '+=10'
    }, {
      duration: 100,
      easing: 'spring',
      loop: true,
      delay: '400'
    }
 );
 */
  $('.more').on('click', function() {
    $('.service').velocity('scroll', {
      duration: 800,
    });
  });

/*
  var fadeStart=100 // 100px scroll or less will equiv to 1 opacity
      ,fadeUntil=200 // 200px scroll or more will equiv to 0 opacity
      ,fading = $('.fading');

  $(window).bind('scroll', function(){
      var offset = $(document).scrollTop()
          ,opacity=0
      ;
      if( offset<=fadeStart ){
          opacity=1;
      }else if( offset<=fadeUntil ){
          opacity=1-offset/fadeUntil;
      }
      fading.css('opacity',opacity);
  });
*/
});
