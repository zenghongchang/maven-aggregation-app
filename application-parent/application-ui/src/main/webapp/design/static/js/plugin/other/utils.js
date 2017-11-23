function Helper(options){
	var obj = new Object();
	
	obj.show_loading = function() {
		var height=$(document).height();
        var width=$(document).width();
        if($("#loading-mask").length==0){
        	var loading = $('<div id="loading-mask" style="display:none"></div>');
        	$("body").append(loading);
        }
        if($("#loading-mask-img").length==0){
        	var loadingImg = $('<img id="loading-mask-img" alt="Loading..." style="display:none"  src="/design/static/images/icons/loading_img.gif"/>');
        	$("body").append(loadingImg);
        }
        $('#loading-mask').css({height:height+'px',width:width+'px'});
        
        $("#loading-mask").show();
        $("#loading-mask-img").show();
	}
	
	obj.hide_loading = function(){
		if($("#loading-mask").length>0){
			$('#loading-mask').hide();
		}
		if($("#loading-mask-img").length>0){
			$("#loading-mask-img").hide();
		}
	}
	
	obj.getNowFormatDate = function(){
		var date = new Date();  
	    var year = date.getFullYear();       //年  
	    var month = date.getMonth() + 1;     //月  
	    var day = date.getDate();            //日  
	    var hh = date.getHours();            //时  
	    var mm = date.getMinutes();          //分  
	    var ss = date.getSeconds();           //秒  
	    var seperator1 = "-";
	    var seperator2 = ":";
	    var clock = year + seperator1;  
	    if(month < 10) {
	    	clock += "0";  
	    } 
	    clock += month + seperator1;  
	    if(day < 10){
	    	clock += "0";  
	    }  
	    clock += day + " ";  
	    if(hh < 10){
	    	clock += "0";  
	    }  
	    clock += hh + seperator2;  
	    if (mm < 10) clock += '0';   
	    clock += mm + seperator2;   
	    if (ss < 10) clock += '0';   
	    clock += ss;   
	    return(clock);
	}
	
	obj.getScrollbarWidth = function() {
	    var oP = document.createElement('p'),
	        styles = {
	            width: '100px',
	            height: '100px'
	        }, i, clientWidth1, clientWidth2, scrollbarWidth;
	    for (i in styles) oP.style[i] = styles[i];
	    document.body.appendChild(oP);
	    clientWidth1 = oP.clientWidth;
	    oP.style.overflowY = 'scroll';
	    clientWidth2 = oP.clientWidth;
	    scrollbarWidth = clientWidth1 - clientWidth2;
	    oP.remove();
	    return scrollbarWidth;
	}
	
	return obj;
}
var helper = new Helper();

function isInteger(obj){
   if(isNaN(obj) || obj%1 != 0 || parseInt(obj) <= 0){
       return false;
   }
   return true;
}