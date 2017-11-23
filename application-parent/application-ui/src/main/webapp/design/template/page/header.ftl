<#include "page/head.ftl"/>
<div class="leftMeun" id="leftMeun">
   <div id="logoDiv"></div>
   <div class="sideMenu">
      <#if navTreeMap??>
		   <#list navTreeMap?keys as key>
		       <#assign firstNavs = navTreeMap[key]>
		       <#list firstNavs as firstNav>
		           <#list firstNav?keys as firstKey>
			               <p class="am-icon-flag"><em></em> <@spring.message "${firstKey}" /> </p>
			               <#assign secondNavs = firstNav[firstKey]>
			               <#if secondNavs?size gt 0>
			                  <ul>
				                  <#list secondNavs as secondNav>
				                      <li><a href="${secondNav['link']}"><@spring.message "${secondNav['title']}" /></a></li>
				                  </#list>
			                  </ul>
			               </#if>
		           </#list>
		       </#list>
		   </#list>
		</#if>		         
   </div>
</div>
<script type="text/javascript">

var _defaultPlay = false;
var _defaultIndex = -1;
var curUrl = window.location.pathname;
var ps = $("#leftMeun .sideMenu a");
$.each(ps,function(k,v) {
    var link = $(v).attr("href");
    if(link==curUrl){
       $(this).closest('li').addClass('select_li');
       var urlObj = $(this).closest('ul');
       _defaultIndex = $(".sideMenu ul").index(urlObj);
       return false;
    }
})
if(_defaultIndex!=-1){
   _defaultPlay = true;
}
$(".sideMenu").slide({
	titCell:"p", //鼠标触发对象
	targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
	effect:"slideDown", //targetCell下拉效果
	delayTime:300 , //效果时间
	triggerTime:150, //鼠标延迟触发时间（默认150）
	defaultPlay:_defaultPlay,//默认是否执行效果（默认true）
	returnDefault:false, //鼠标从.sideMen移走后返回默认状态（默认false）
	defaultIndex:_defaultIndex
});
$(function(){
   $(".select2").select2({placeholder: "请选择",allowClear:true});
   qiao.bs.bsdate('.qdate');
   qiao.bs.bsdate('.qdatetime',{
      todayBtn:  1,
      minView:'hour',
      format:'yyyy-mm-dd hh:ii:ss',
      initialDate: new Date(),
   });
})
</script> 
<div id="rightContent"> 
    <input type="hidden" id="currentLoginName" value="${currentUser.loginName!''}">   
	<div id="rightTopNav">
	      <div class='container-fluid'>
               <ul class="nav navbar-nav">
                   <#if currentUrl??>
	                  <#if currentUrl=='/channel/editCustomerChannel'>
	              	  	 <li><a href="#">${customerChannel.name!''}</a></li>
	              	  <#elseif currentUrl=='/channel/editServicerChannel'>
	              	     <li><a href="#">${servicerChannel.name!''}</a></li>
	              	  </#if>
	              </#if>
               </ul>
	      
	           <ul class="nav navbar-nav navbar-right">
		          <li><a href="#">${currentUser.name!''}</a></li>
		          <li><a href="/logout"><span class="glyphicon glyphicon-off nav_icon" aria-hidden="true"></span></a></li>
		       </ul>
		       
		       <form class="navbar-form navbar-right nav_form">
		         <div class="form-group">
		          	<div class="input-group">
				      <input id="search_order" type="text" class="form-control input-sm" placeholder="快速搜索订单">
				      <div class="input-group-addon nav_search"> <span class="glyphicon glyphicon-search form-control-feedback nav_glyphicon"></span></div>
				    </div>
		         </div>
		      </form>
		      <ul class="nav navbar-nav navbar-right">
		          <li>
			          <a id="show_message" href="javascript:void(0);">
				          <span class="glyphicon glyphicon-bell nav_icon" aria-hidden="true"></span> 
				          <span id="no_read_message_count" class="no_red_new_num">0</span>
			          </a>
		          </li>
		       </ul>
		      
		      
	      </div>
	</div>