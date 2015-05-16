$(function() {
  $('.article').each(function() {
    $(this).click(function() {
      location.href = $(this).find('a').attr('href');
    });
  });

  $('.arrow').each(function() {
    $(this).click(function() {
      location.href = $(this).find('a').attr('href');
    });
  });
});
