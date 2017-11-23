<#macro pagination formId>
  <style type="text/css"> 
      ._pagination{background: #fff;border-bottom: 1px solid #ddd;}
      ._pagination img{vertical-align:middle; width:32px; height:30px;border:1px solid #eff0f4;cursor:pointer;}
      ._pagination .separator{font-size: 0.9em;padding: 0 6px;}
      ._pagination .select3{margin: 0 3px;}
  </style>
  <div class="_pagination">
     <form class="form-inline">
         <div class="form-group">
	         <@spring.message "which.page"/>  
		     <span id="prePageSpan"> 
			    <#if (pager['currentPage'] <= 1)>
			        <img  name="preImg1" src="${imagesPath}icons/previous_no.jpg">
			    <#else>
			        <img  name="preImg2" class="middle-page" title="<@spring.message "go.to.previous.page"/>" src="${imagesPath}icons/previous.jpg" onclick="turnPage('-1','${formId}')"> 
			    </#if>  
		     </span>
		     <input id="currentPage" name="currentPage" class="form-control input-sm" style="width:40px" type="text" value="${pager['currentPage']}" onkeydown="goToPage(event,'${formId}')" />
		     <span id="nextPageSpan">
			    <#if (pager['currentPage'] >= pager['totalPages'])>
			           <img  name="nextImg1" src="${imagesPath}icons/nextpage_no.jpg">
			    <#else>
			           <img name="nextImg2" class="middle-page" title="<@spring.message "go.to.next.page"/>" src="${imagesPath}icons/nextpage.jpg" onclick="turnPage('1','${formId}')">
			    </#if> 
		    </span> 
		    <span>共</span> <span id="totalPages">${pager['totalPages']!'0'}</span> <span>页</span>       
		    <span class="separator">|</span>
		    <@spring.message "view"/>
	     </div>
	    <div class="form-group">
		    <#assign pageSizeList = [20,40,60,80,100]>
		    <select id="pageLimit" onchange="turnPage('0','${formId}')" class='select3 form-control input-sm'>     
		        <#list pageSizeList as pageSize>
		             <#if pager['pageLimit'] == pageSize>
		                  <option selected="selected" value="${pageSize}">${pageSize}</option>
		             <#else>
		                  <option value="${pageSize}">${pageSize}</option>
		             </#if>
		        </#list>
		    </select>
	    </div>
	    <div class="form-group">
		    <@spring.message "per.page"/> <span class="separator">|</span>
		    <span>共</span> <span id="totalRecords">${pager['totalRecords']!'0'}</span> <span>条记录</span>
	    </div>
     </form>
  </div>
</#macro>
<script>
 $(function(){
     $(".select3").select2({
		  minimumResultsForSearch: Infinity,
		  width:'51px'
	 });
 })
function goToPage(event,formId){
    var e = event?event:window.event;
    if (e.keyCode == 13) {
        var currentPage = $("#currentPage").val();
        var totalPages = $("#totalPages").html().trim();
        if(!currentPage || isNaN(currentPage) || currentPage<1){
            currentPage = 1
        }else if(currentPage>totalPages){
            currentPage = totalPages;
        }else{
            currentPage = parseInt(currentPage);
        }
        var pageLimit = $("#pageLimit").val();
        changePage(formId,currentPage,pageLimit);
    }
}
function turnPage(flag,formId){ 
    var currentPage = $("#currentPage").val();
    if(!currentPage || isNaN(currentPage)){
        currentPage=1;
    }
	var pageLimit = $("#pageLimit").val();
    currentPage=parseInt(currentPage)+parseInt(flag);
    changePage(formId,currentPage,pageLimit);
}
function changePage(formId,currentPage,pageLimit){
    if(!formId) {
		return false;
	}
    var formObj =  document.getElementById(formId);
    var pageNoInput = document.createElement("input"); 
    pageNoInput.type = "hidden"; 
    pageNoInput.name = "currentPage"; 
    pageNoInput.value = currentPage; 
    
    var pageSizeInput = document.createElement("input"); 
    pageSizeInput.type = "hidden"; 
    pageSizeInput.name = "pageLimit"; 
    pageSizeInput.value = pageLimit; 
    
    formObj.appendChild(pageNoInput); 
    formObj.appendChild(pageSizeInput); 
    formObj.submit();
}
 </script>