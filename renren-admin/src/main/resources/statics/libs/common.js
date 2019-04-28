


var isSupportTouch = $(window).width() <= 1024;



(function ($) {
    $(function () {
	    
	$(".foot_share a").each(function(){
		$(this).hover(function(){
			$(this).find("img").attr("src",$(this).find("img").data("img1"));
		},function(){
			$(this).find("img").attr("src",$(this).find("img").data("img2"));
		})
	})
	    
	$(".foot_r_logo img").each(function(){
		$(this).hover(function(){
			$(this).attr("src",$(this).data("img1"));
		},function(){
			$(this).attr("src",$(this).data("img2"));
		})
	})
		
		$(".navul2 li").each(function(i){
			$(this).click(function(){
				if(i==1){
					$("html,body").stop().animate({scrollTop:$(".cult_index .part_2").offset().top-108});
				}else if(i==3){
					$("html,body").stop().animate({scrollTop:$(".cult_index .part_4").offset().top-108});
				}
			})
		})
        

        $(".about_wx,.foot_share_wx").click(function () {
            $("#jiathis_weixin_share1").show();
            $("#jiathis_webchat1 img").attr("src", $(this).data("img"));
        })

        $(".jiathis_weixin_close1").click(function () {
            $("#jiathis_weixin_share1").hide();
        })


	var ani_one=true;
	var ani_one_back=true;
	
	var ani_two=true;
	var ani_two_back = true;

	var ani_intro = true;
	var ani_intro_back = true;

	var ani_hope = true;
	var ani_hope_back = true;
	
	var mwheelAddNum=true;
	
	
	
	function mwheelscroll() {
	    try{
	        if ($(window).scrollTop() >= ($(".in_news_main").offset().top + $(".in_news_main").height() - $(window).height()) - $(".in_news_main").height()/2) {
			
	            if(ani_one==true){

	                $(".in_news_main").addClass("on");
											
	                ani_one=false;
	                ani_one_back=true;
	            }
	        }
		
	        if ($(window).scrollTop() < ($(".in_news_main").offset().top + $(".in_news_main").height() - $(window).height()) - $(".in_news_main").height()/2) {
			
	            if(ani_one_back==true){

	                $(".in_news_main").removeClass("on");
	                ani_one=true;
	                ani_one_back=false;
	            }
	        }
	    }catch(e){}
		

	    try{
	        if ($(window).scrollTop() >= ($(".in_product_main").offset().top + $(".in_product_main").height() - $(window).height()) - $(".in_product_main").height()/2) {
			
	            if(ani_two==true){

	                $(".in_product_main").addClass("on");
											
	                ani_two=false;
	                ani_two_back=true;
	            }
	        }
		
	        if ($(window).scrollTop() < ($(".in_product_main").offset().top + $(".in_product_main").height() - $(window).height()) - $(".in_product_main").height()/2) {
			
	            if(ani_two_back==true){

	                $(".in_product_main").removeClass("on");
											
	                ani_two=true;
	                ani_two_back=false;
	            }
	        }
	    }catch(e){}


	    try{
	        if ($(window).scrollTop() >= ($(".about_intro .top").offset().top + $(".about_intro .top").height() - $(window).height()) - $(".about_intro .top").height()/2) {
			
	            if (ani_intro == true) {

	                $(".about_intro").addClass("on");
					if(mwheelAddNum==true){
						addNum();
						mwheelAddNum=false;
					}
											
	                ani_intro = false;
	                ani_intro_back = true;
	            }
	        }

	        if ($(window).scrollTop() < ($(".about_intro .top").offset().top + $(".about_intro .top").height() - $(window).height()) - $(".about_intro .top").height() / 2) {

	            if (ani_intro_back == true) {

	                $(".about_intro").removeClass("on");

	                ani_intro = true;
	                ani_intro_back = false;
	            }
	        }
	    }catch(e){}


		try{
	        if ($(window).scrollTop() >= ($(".hope").offset().top + $(".hope").height() - $(window).height()) - $(".hope").height()/2) {
			
	            if (ani_hope == true) {

	                $(".hope").addClass("on");
											
	                ani_hope = false;
	                ani_hope_back = true;
	            }
	        }

	        if ($(window).scrollTop() < ($(".hope").offset().top + $(".hope").height() - $(window).height()) - $(".hope").height() / 2) {

	            if (ani_hope_back == true) {

	                $(".hope").removeClass("on");

	                ani_hope = true;
	                ani_hope_back = false;
	            }
	        }
	    }catch(e){}

	

		
	}
	
	
	function addNum(){
		
		//公司介绍数字滚动
		var count_add1 = 0;
		var count_add2 = 0;
		var count_add3 = 0;
		var addTimer = null;
		if (!isSupportTouch) {
			addTimer1 = setInterval(function () {
				count_add1 += Math.floor(Math.random() * 20);
				if (count_add1 >= Number($(".num1").attr("rel"))) {
					$(".num1").text(Number($(".num1").attr("rel")));
				} else {
					$(".num1").text(count_add1);
				}
			}, 10)
		} else {
			$(".num1").text($(".num1").attr("rel"));
		}
	
		if (!isSupportTouch) {
			addTimer2 = setInterval(function () {
				count_add2 += Math.floor(Math.random() * 33);
				if (count_add2 >= Number($(".num2").attr("rel"))) {
					$(".num2").text(Number($(".num2").attr("rel")));
				} else {
					$(".num2").text(count_add2);
				}
			}, 10)
		} else {
			$(".num2").text($(".num2").attr("rel"));
		}
	
		if (!isSupportTouch) {
			addTimer3 = setInterval(function () {
				count_add3 += Math.floor(Math.random() * 500);
				if (count_add3 >= Number($(".num3").attr("rel"))) {
					$(".num3").text(Number($(".num3").attr("rel"))+'+');
				} else {
					$(".num3").text(count_add3+'+');
				}
			}, 10)
		} else {
			$(".num3").text($(".num3").attr("rel")+'+');
		}
	}



	$(window).scroll(function () {
	    
	        mwheelscroll();

	   

    })

    
	})

    //无图图像
    var nullimg = 'images/error.png';
    function lod(t) {
        t.onerror = null;
        t.src = nullimg
    }
    $(function () {
        $(".ratio-img").each(function () {
            if ($(this).attr("src") == "") {
                $(this).attr({ "src": nullimg })
            }
        })
    })

    //--------------模拟下拉
    $(document).on("click", ".select-box dt", function (e) {
        e.preventDefault();
        e.stopPropagation();


        $(this).parents(".select-box").toggleClass("open");
        return false;


    })
    $(document).on("click", ".select-box dd a", function (e) {
        $(this).addClass("on").siblings().removeClass("on");
        $(this).parents(".select-box").find("dt b").text($(this).text());
        $(this).parents(".select-box").find("input").val($(this).attr("data-val"));

        $(".select-box").removeClass("open");
    })
    $(document).click(function () {
        $(".select-box").removeClass("open");
    })
    //end

    $(function () {
        if ($(".phone_menu").is(":visible")) {
            $(".banner_index li").each(function (i) {
                $(".banner_index li:eq(" + i + ") img").attr("src", $(".banner_index li:eq(" + i + ") img").data("img"));
            })
			try{
				$(".banner_index ul").bxSlider({

				});
			} catch (e) { }
            
        } else {
                var dotCount = 0;
                var dotClickCount = 0;

                var bannerTimer = null;
                var bannerTimeout = null;
                var movetime = 6000;
                var moveSpeed = 1500;
                var bannerSize = $(".banner_index_new li").size();
                var moveLength = $(window).width();
                var dir = 1;

                $(window).resize(function () {
                    moveLength = $(window).width();
                    $(".banner_index_new,.banner_index").height(moveLength * 0.336458);
                    $(".banner_index_new li").css({ "width": $(".banner_index_new").width(), "float": "left", "position": "absolute" });
                    $(".banner_index_new ul").css({ "width": $(".banner_index_new").width() * bannerSize, "overflow": "hidden", "position": "relative" });
                })

                $(window).resize();



                $(".banner_index_new").append('<a href="javascript:void(0)" class="banner_left"></a><a href="javascript:void(0)" class="banner_right"></a>');
                $(".banner_index_new").append('<dl></dl>');
                for (var i = 0; i < $(".banner_index_new li").size() ; i++) {
                    $(".banner_index_new dl").append('<dd></dd>');
                }

                $(".banner_index_new dl dd:first").addClass("active");
                $(".banner_index_new li").eq(0).addClass("curr");

                $(document).on("click", ".banner_index_new dl dd", function () {
                    var nIndex = $(".banner_index_new dl dd").index(this);
                    if (!$(".banner_index_new ul").is(":animated") && $(".banner_index_new ul li:eq(" + nIndex + ")").find("video").size() == 0) {
                        clearInterval(bannerTimer);
                        
                            $(".banner_index_new li.banner_video video").remove();
                        
                        dotClickCount = nIndex;
                        if (nIndex > dotCount) {
                            $(".banner_index_new li:eq(" + nIndex + ")").css({ "left": moveLength });
                            $(".banner_index_new ul").stop().animate({ "left": moveLength * -1 }, 1000, function () {
                                $(".banner_index_new li").css({ "left": 0 }).removeClass("curr");
                                $(".banner_index_new li:eq(" + nIndex + ")").css({ "left": 0 }).addClass("curr");

                                $(".banner_index_new ul").css({ "left": 0 });
                            });
                            dotCount = nIndex;
                        } else if (nIndex < dotCount) {
                            $(".banner_index_new ul").css({ "left": moveLength * -1 });
                            $(".banner_index_new li").css({ "left": 0 }).removeClass("curr");
                            $(".banner_index_new li:eq(" + nIndex + ")").css({ "left": 0 }).addClass("curr");
                            $(".banner_index_new li:eq(" + dotCount + ")").css({ "left": moveLength });
                            $(".banner_index_new ul").stop().animate({ "left": 0 }, 1000, function () {
                                $(".banner_index_new li").css({ "left": 0 }).removeClass("curr");
                                $(".banner_index_new li:eq(" + nIndex + ")").css({ "left": 0 }).addClass("curr");

                                $(".banner_index_new ul").css({ "left": 0 });
                            });
                            dotCount = nIndex;
                        }
                        $(".banner_index_new dl dd:eq(" + nIndex + ")").removeClass("actove").addClass("active").siblings().removeClass();
                        if ($(".banner_index_new li:eq(" + nIndex + ")").hasClass("banner_video")) {



                            $(".banner_index_new li:eq(" + nIndex + ")").append("<video width='500' height='400' src='"+$(".banner_index_new li:eq(" + nIndex + ")").data("video")+"' type='video/mp4' poster='images/banner3.jpg' id='media_banner' preload='none'></video>")
                            document.getElementById("media_banner").play();

                            setTimeout(function () {
                                movetime = (document.getElementById("media_banner").duration - 1) * 1000;
                                bannerTimer = setInterval(function () {
                                    $(".banner_right").click();
                                    setTimeout(function () {
                                        $(".banner_index_new li:eq(" + nIndex + ")").siblings().find("video").remove();
                                    }, 1000)
                                }, movetime)
                            }, 1000)
                        } else {
                            movetime = 6000;
                            bannerTimer = setInterval(function () {
                                $(".banner_right").click();
                            }, movetime)
                        }
                    }
                })

                //{ easing: 'easeInQuint', duration: 600 }
                if ($(".banner_index_new li").size() > 1) {
                    $(".banner_right").on("click", function () {
                        if (!$(".banner_index_new ul").is(":animated")) {
                            clearInterval(bannerTimer);
                            dir = 1;
                            if (dotClickCount >= bannerSize - 1) {
                                dotClickCount = 0;
                                right_click(dotClickCount);
                            } else {
                                dotClickCount++;
                                right_click(dotClickCount);
                            }
                        }
                    })

                    $(".banner_left").on("click", function () {
                        if (!$(".banner_index_new ul").is(":animated")) {
                            clearInterval(bannerTimer);
                            dir = 0;
                            if (dotClickCount <= 0) {
                                dotClickCount = bannerSize - 1;
                                left_click(dotClickCount);
                            } else {
                                dotClickCount--;
                                left_click(dotClickCount);
                            }
                        }
                    })

                }

                function right_click(nIndex) {
                    $(".banner_index_new li.banner_video video").remove();
                    $(".banner_index_new li:eq(" + nIndex + ")").css({ "left": moveLength });
                    $(".banner_index_new ul").stop().animate({ "left": moveLength * -1 }, 1000, function () {
                        $(".banner_index_new li").css({ "left": 0 }).removeClass("curr");
                        $(".banner_index_new li:eq(" + nIndex + ")").css({ "left": 0 }).addClass("curr");

                        $(".banner_index_new ul").css({ "left": 0 });
                    });
                    dotCount = nIndex;
                    $(".banner_index_new dl dd:eq(" + nIndex + ")").removeClass("actove").addClass("active").siblings().removeClass();
                    if ($(".banner_index_new li:eq(" + nIndex + ")").hasClass("banner_video")) {



                        $(".banner_index_new li:eq(" + nIndex + ")").append("<video width='500' height='400' src='" + $(".banner_index_new li:eq(" + nIndex + ")").data("video") + "' type='video/mp4' poster='images/banner3.jpg' id='media_banner' preload='none'></video>")
                        document.getElementById("media_banner").play();

                        setTimeout(function () {
                            movetime = (document.getElementById("media_banner").duration - 1) * 1000;
                            bannerTimer = setInterval(function () {
                                $(".banner_right").click();
                            }, movetime)
                        }, 1000)
                    } else {
                        movetime = 6000;
                        bannerTimer = setInterval(function () {
                            $(".banner_right").click();
                        }, movetime)
                    }
                }

                function left_click(nIndex) {
                    $(".banner_index_new li.banner_video video").remove();
                    $(".banner_index_new ul").css({ "left": moveLength * -1 });
                    $(".banner_index_new li").css({ "left": 0 }).removeClass("curr");
                    $(".banner_index_new li:eq(" + nIndex + ")").css({ "left": 0 }).addClass("curr");
                    $(".banner_index_new li:eq(" + dotCount + ")").css({ "left": moveLength });
                    $(".banner_index_new ul").stop().animate({ "left": 0 }, 1000, function () {
                        $(".banner_index_new li").css({ "left": 0 }).removeClass("curr");
                        $(".banner_index_new li:eq(" + nIndex + ")").css({ "left": 0 }).addClass("curr");

                        $(".banner_index_new ul").css({ "left": 0 });
                    });
                    dotCount = nIndex;
                    $(".banner_index_new dl dd:eq(" + nIndex + ")").removeClass("actove").addClass("active").siblings().removeClass();

                    //part_video
                    if ($(".banner_index_new li:eq(" + nIndex + ")").hasClass("banner_video")) {



                        $(".banner_index_new li:eq(" + nIndex + ")").append("<video width='500' height='400' src='" + $(".banner_index_new li:eq(" + nIndex + ")").data("video") + "' type='video/mp4' poster='images/banner3.jpg' id='media_banner' preload='none'></video>")
                        document.getElementById("media_banner").play();

                        setTimeout(function () {
                            movetime = (document.getElementById("media_banner").duration - 1) * 1000;
                            bannerTimer = setInterval(function () {
                                $(".banner_right").click();
                            }, movetime)
                        }, 1000)
                    } else {
                        movetime = 6000;
                        bannerTimer = setInterval(function () {
                            $(".banner_right").click();
                        }, movetime)
                    }




                }

                bannerTimer = setInterval(function () {
                    $(".banner_right").click();
                }, movetime)
        }
    })
	

})(jQuery);



function doPrint() {
    bdhtml = window.document.body.innerHTML;
    sprnstr = "<!--startprint-->";
    eprnstr = "<!--endprint-->";
    prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17);
    prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
    OpenWindow = window.open("");
    OpenWindow.document.write("<!DOCTYPE html PUBLIC '-\/\/W3C\/\/DTD XHTML 1.0 Transitional\/\/EN' 'http:\/\/www.w3.org\/TR\/xhtml1\/DTD\/xhtml1-transitional.dtd'><html xmlns='http:\/\/www.w3.org\/1999\/xhtml'><HEAD><meta http-equiv=\"Content-Type\" content=\"text\/html; charset=utf-8\" \/><TITLE>打印页<\/TITLE><link href=\"..\/css\/common.css\" rel=\"stylesheet\" type=\"text\/css\" \/><link href=\"..\/css\/style.css\" rel=\"stylesheet\" type=\"text\/css\" \/><\/HEAD><BODY><div id=\"printbox\" ><\/div><\/BODY><\/HTML>");
    OpenWindow.document.getElementById("printbox").innerHTML = prnhtml;
    OpenWindow.document.close();
    OpenWindow.print();
}



//无图图像
var nullimg = '../images/error.jpg';
function lod(t) {
    t.onerror = null;
    t.src = nullimg
}
$(document).ready(function () {
    $("img").each(function () {
        if ($(this).attr("src") == "") {
            $(this).attr({ "src": nullimg })
        }
    })
})
//


function searchClick(url) {
    window.location.href = url;
}


function UrlSearch() 
{
   var name,value; 
   var str=location.href; //取得整个地址栏
   var num=str.indexOf("#") 
   str=str.substr(num+1); //取得所有参数   stringvar.substr(start [, length ]
   return str; 
} 

