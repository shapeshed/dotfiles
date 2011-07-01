$(document).ready(function() {
	$('body')
		.css("background-color", "#fff");
	$('body, td, .admin.td, .subtext.td, input, input[type="submit"], textarea, a.link, a.visited, .default, .admin, .title, .adtitle, .subtext, .yclinks, .pagetop, .comhead, .comment, .dead')
		.css("font-family", "Helvetica")
	$('.admin.td')
		.css("font-family", "Helvetica")
	$('body table:first tr:nth-child(2)').css("display", "none");
	$('table:first tr:last').css("display", "none");
	$('table:first').css("width", "960px");
	$('table:first').css("background-color", "transparent");
	$('table:first tr').css("background-color", "#f6f6ef");
	$('table:first tbody tr td table')
		.css("witdh", "100%");
	$('table:first table:first tr td').css("background-color", "#ff6600");
	$('table:first table:first tr td').css("background-color", "#ff6600");

	/*----------------------------------------
	* Navigation
	*---------------------------------------*/
	$('img[src$="http://ycombinator.com/images/y18.gif"]').css("margin-right", "10px");
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

	/*
	$('table:first tbody tr td table tr td')
		.css("padding-bottom", "10px")
		.css("border-bottom", "1px dotted #ccc");
	*/
	$('table table')
		.css("width", "100%")
	$('tr td:first')
		.css("border-top-left-radius", "10px")
		.css("padding", "20px");
	$('tr td:first').css("border-top-right-radius", "10px");

	/*----------------------------------------
	* Posts
	*---------------------------------------*/
	$('html body center table tbody tr:nth-child(3) td table tbody tr:nth-child(n+1)')
		.css("margin", "15px 5px 0px 20px")
		.css("width", "900px")
		.css("float", "left")
	$('html body center table tbody tr td table tbody tr td.title:nth-child(1)')
		.css("background", "#ccc")
		.css("text-align", "center")
		.css("padding", "10px 12px")
		.css("border-radius", "20px")
		.css("text-shadow", "rgba(0, 0, 0, 0.296875) 0 1px 1px");
	$('html body center table tbody tr td tbody tr:nth-child(3n+1)')
		
		
	$('html body center table tbody tr:nth-child(3) td table tbody tr:nth-child(n+1) td:nth-child(n+2)')
		.css("width", "30px")
	$('html body center table tbody tr:nth-child(3) td table tbody tr:nth-child(n+1) td:nth-child(n+3)')
		.css("width", "850px")
		.css("padding-top", "10px")
		.css("float", "left")
	$('html body center table tbody tr:nth-child(3) td table tbody tr:nth-child(n+1) td:nth-child(n+3) a')
		.css("margin-top", "10px")

	//$('td.subtext').parent().prev().children('td:nth-child(3)').append($('this').html());
	$('td.subtext').each(function() {
		$(this).parent().prev().children('td:nth-child(3)').append('<br />' + $(this).html());
		$(this).hide();
	});
});


