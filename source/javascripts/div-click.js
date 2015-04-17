$('.article, .arrow').click(function() {
  location.href = $('.article').find('a').attr('href');
});
