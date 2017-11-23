$(document).ready(function() {
	$('.date_range i').click(function() {
	    $(this).parent().find('input').click();
	});
	
	var locale = {
		"format" : 'YYYY-MM-DD',
		"separator" : " ~ ",
		"applyLabel" : "确定",
		"cancelLabel" : "取消",
		"fromLabel" : "起始时间",
		"toLabel" : "结束时间'",
		"customRangeLabel" : "自定义",
		"weekLabel" : "W",
		"daysOfWeek" : [ "日", "一", "二", "三", "四", "五", "六" ],
		"monthNames" : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月",
				"八月", "九月", "十月", "十一月", "十二月" ],
		"firstDay" : 1
	};

	var options = {
		//autoUpdateInput:false,
		maxDate : moment(), //最大时间
		showCustomRangeLabel: false,
		autoApply: true,
		timePicker12Hour : false,//是否使用12小时制来显示时间
		showWeekNumbers : false,//是否显示第几周
		alwaysShowCalendars: true,
		showDropdowns:true,
		ranges :{
	        '今日': [moment(), moment()],
	        '昨日': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	        '最近7日': [moment().subtract(6, 'days'), moment()],
	        '最近30日': [moment().subtract(29, 'days'), moment()],
	        '本月': [moment().startOf('month'), moment().endOf('month')],
	        '上个月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	    },
	    locale:locale,
	};
	$('.date_range_picker').daterangepicker(options);
	/*$('.date_range_picker').each(function(){
		var $this = $(this);
		var nowValue = $this.val();
		if(nowValue && nowValue.indexof('~') > -1){
			
		}
		$this.daterangepicker(options, function(start, end, label) {
			$this.val(start.format('YYYY/MM/DD') + ' ~ ' + end.format('YYYY/MM/DD'));
		})
		
	})*/
})