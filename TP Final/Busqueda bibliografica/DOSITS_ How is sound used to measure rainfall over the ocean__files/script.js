$(document).ready(function() {
    
	
	/*    NAV SCROLL    */
	var scrollHeight = $('.scrollSubNav > .inner > ul').height();
	//console.log(scrollHeight);
	var height = $('.scrollSubNav').find('.inner').height();
	var scrollPos =0;
	var scrollBox;
	$('.scrollSubNav').find('.inner').scrollTop(scrollPos);
	
	if (navigator.userAgent.indexOf(/Android|BlackBerry|iPhone|iPad|iPod|Opera Mini|IEMobile/i)== -1) {
		$(".scrollSubNav").mousemove(function(e) {
			scrollHeight = $('.scrollSubNav > .inner > ul').height();
			//console.log(scrollHeight);
			var offset = $(this).offset();
			var theY = (((e.pageY - offset.top)/ height) * (scrollHeight - height + 30));

			$('.scrollSubNav > .inner').animate({scrollTop: theY}, 10);
	
	  //console.log("  Y: " + $('.scrollSubNav').find('.inner').height() + "scrollPos" + (scrollHeight));	
		});
	}
	

		
	$('.navbar-toggle').click(function(e) {
        $(this).toggleClass('active');
        $('.theNav ul').toggleClass('active');
 
        e.preventDefault();
    });
	
	$('.theNav ul li div:nth-child(2)').click(function(e) {
		
		 if($(e.target).parent().is('.drop')) {
			 //console.log(e.target);
            closeDrop($(e.target).parent());
        }else {
			//console.log($(e.target).parent());
			closeDrop($(e.target).parent());
			$(this).parent().addClass('drop');
		}
 
        //e.preventDefault();
    });
	
	
	
	
	function closeDrop(drops){
		//$('.theNav >ul >li').removeClass('drop');
		var dropPath = $(drops).parent();
		$(dropPath).find('li').removeClass('drop');
		
	}
	
	
	$('#contentBody_inner2').find('img').removeAttr('hspace');
	
	
	var frontImage = $('.featureFront').find('img').width();
	function resize(){
		
		 var topWidth = $('#contentHome').width();
		 var topHeight = topWidth*.1675;
		var topMargin = $('#contentHome').height()/topWidth;
		if (navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1) {                  
			$('.shadow').css('margin-top', topHeight+'px');
			
			if ($('.shadow').width() < 640){
				topHeight = topWidth*.30;
				$('.shadow').css('margin-top', topHeight+'px');
			}
			
			if ($('.shadow').width() > 1200 || navigator.userAgent.indexOf('iPhone') != -1){
				$('.shadow').removeAttr('style');
			}
			
			frontImage = 837;
		}
		
		var imageSize = $('.featureFront').width();
		var marginLeft = (frontImage - imageSize) /2;
		$('.featureFront').find('img').css('margin-left', -marginLeft+'px');
		if ($('.shadow').width() > 640) {
			$('.featureFront').find('img').removeAttr('style');
		}
		
		
		console.log(imageSize + " img " + (frontImage - imageSize));
		
	}
	
	window.onresize = resize
	window.onload = resize;
	
	//$(document).on("pagecreate","#pageone",function(){
	                         
	//});
	
	
});