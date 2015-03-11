//= require "jquery/dist/jquery.min.js"
//= require "bootstrap-sass/assets/javascripts/bootstrap.min.js"
//= require_tree .

function setHeader(){
	// onload, onresize時にヘッダサイズを変更
	$(window).on('load resize', function() {
		// 画面の表示領域を取得
		var wW = $(window).innerWidth();
		var wH = $(window).innerHeight();
		// cssに反映
		$('header.jumbotron').css('height', wW+'px');
		$('header.jumbotron').css('height', wH+'px');
	});
};
