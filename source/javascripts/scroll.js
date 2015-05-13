;(function() {
  var $header = $('.fading');
  $(window).on('scroll', function() {
    var scrollTop = $(this).scrollTop();
    var height = $header.outerHeight();
    if (height > scrollTop) {
      var opacity = (height - scrollTop) / height;
      $header.css({ 'opacity': opacity });
    }
  });
})();
