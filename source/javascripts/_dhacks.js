$(function() {
  if (!$.cookie('dhacks'))
    $.cookie('dhacks', '1', { expires: 1 });

  if ($.cookie('dhacks') === '1') {
    $('.dhacks').css({
      'display': 'block'
    });
  }

  $('.close').on('click', function() {
    $('.dhacks').animate({
      'height': '0',
      'padding': '0'
    }, 200);
    $.cookie('dhacks', '0');
  });
});

