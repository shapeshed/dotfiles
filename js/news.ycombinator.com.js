$(document).ready(function() {
	$('body')
		.css("background-color", "#ccc");
	$('body, td, .admin.td, .subtext.td, input, input[type="submit"], textarea, a.link, a.visited, .default, .admin, .title, .adtitle, .subtext, .yclinks, .pagetop, .comhead, .comment, .dead')
		.css("font-family", "Helvetica")
	$('.admin.td')
		.css("font-family", "Helvetica")
	$('table:first tr:last').css("display", "none");
	$('table:first').css("width", "800px");
	$('table:first').css("background-color", "#fff");
	$('table:first tbody tr td table')
		.css("witdh", "100%");
	$('table:first table:first tr td').css("background-color", "#ff6600");
	$('table:first table:first tr td').css("background-color", "#ff6600");

	/*----------------------------------------
	* Navigation
	*---------------------------------------*/
	$('.pagetop')
		.css("color", "#ff6600")
	$('.pagetop a')
		.css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#A9A9A9), to(#7A7A7A))")
		.css("border-radius", "1.6em")
		.css("color", "#E7E5E5")
		.css("font-weight", "bold")
		.css("margin", "0")
		.css("padding-bottom", "8px")
		.css("padding-left", "20px")
		.css("padding-right", "20px")
		.css("padding-top", "8px")
		.css("text-decoration", "none")
		.css("text-shadow", "rgba(0, 0, 0, 0.296875) 0 1px 1px");
	$(".pagetop a").hover(
		function(){
			$(this).css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))")
		},
		function(){
			$(this).css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#A9A9A9), to(#7A7A7A))")
		}
	);
	/*----------------------------------------
	* Homepage
	*---------------------------------------*/
	if(window.location.pathname == '/' || window.location.pathname == '/news'){
		$('.pagetop a[href$="news"]')
			.css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))");
		$('.pagetop a[href$="news"]').hover(
			function(){
				$(this).css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))")
			},
			function(){
				$(this).css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))")
			}
	);
	}
	/*----------------------------------------
	* New
	*---------------------------------------*/
	if(window.location.pathname == '/newest'){
		$('.pagetop a[href$="newest"]')
			.css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))");
		$('.pagetop a[href$="newest"]').hover(
			function(){
				$(this).css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))")
			},
			function(){
				$(this).css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))")
			}
	);
	}
	/*----------------------------------------
	* Comments
	*---------------------------------------*/
	if(window.location.pathname == '/newcomments'){
		$('.pagetop a[href$="newcomments"]')
			.css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))");
		$('.pagetop a[href$="newcomments"]').hover(
			function(){
				$(this).css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))")
			},
			function(){
				$(this).css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))")
			}
	);
	}
	/*----------------------------------------
	* Ask
	*---------------------------------------*/
	if(window.location.pathname == '/ask'){
		$('.pagetop a[href$="ask"]')
			.css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))");
		$('.pagetop a[href$="ask"]').hover(
			function(){
				$(this).css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))")
			},
			function(){
				$(this).css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))")
			}
	);
	}
	/*----------------------------------------
	* Jobs
	*---------------------------------------*/
	if(window.location.pathname == '/jobs'){
		$('.pagetop a[href$="jobs"]')
			.css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))");
		$('.pagetop a[href$="jobs"]').hover(
			function(){
				$(this).css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))")
			},
			function(){
				$(this).css("background-image", "-webkit-gradient(linear, 0 0%, 0 100%, from(#ccc), to(#7A7A7A))")
			}
	);
	}
	$('span.comhead')
		.css("float", "right")
		.css("border-radius", "5px")
		.css("padding", "5px")
		.css("box-shadow", "rgba(0, 0, 0, 0.496094) 0 1px 1px")
		.css("background", "#ccc");
	$('table:first tbody tr td table tr td')
		.css("padding-bottom", "10px")
		.css("border-bottom", "1px dotted #ccc");
	$('table table')
		.css("width", "100%")
	$('tr td:first')
		.css("border-top-left-radius", "10px")
		.css("padding", "20px");
	$('tr td:first').css("border-top-right-radius", "10px");

});


