<#macro pagination formId>
  <style type="text/css"> 
      ._pagination{background: #fff;border-bottom: 1px solid #ddd;}
      ._pagination img{vertical-align:middle; width:32px; height:30px;border:1px solid #eff0f4;cursor:pointer;}
      ._pagination .separator{font-size: 0.9em;padding: 0 6px;}
      ._pagination .select3{margin: 0 3px;}
      ._pagination .pagination{margin: 5px 0;}
      ._pagination .pagination > li > a{border:none;}
  </style>
  <#assign currentPage = pager['currentPage'] >
  <#assign totalPages = pager['totalPages'] >
  <#assign pageLimit = pager['pageLimit'] >
  <#assign totalRecords = pager['totalRecords']>
  <#assign showPages=10 >
  <#assign pageSizeList = [20,40,60,80,100]>
  
  <div class="_pagination">
     <form class="form-inline">
	    <div class="form-group">
	        <ul class="pagination pagination-sm">
	            <#if currentPage==1>
	                <li class="disabled"><a href="#"><@spring.message "first.page" /></a></li>
	                <li class="disabled"><a href="#">&laquo;</a></li>
	            <#else>
	                <li><a href="javascript:void(0);" onclick="turnPage('0','${formId}','1')"><@spring.message "first.page" /></a></li>
	            	<li><a href="javascript:void(0);" onclick="turnPage('-1','${formId}','${currentPage}')">&laquo;</a></li>
	            </#if>
	            <#if currentPage-showPages/2 gt 0>  
		            <#assign start = currentPage-(showPages-1)/2/>  
		            <#if showPages gt totalPages>  
		                <#assign start = 1/>  
		            </#if>  
		        <#else>  
		            <#assign start = 1/>  
		        </#if> 
		         
		        <#if totalPages gt showPages>  
		            <#assign end = (start+showPages-1)/>  
		            <#if end gt totalPages>  
		                <#assign start = totalPages-showPages+1/>  
		                <#assign end = totalPages/>  
		            </#if>  
		        <#elseif totalPages==0>
		            <#assign end = 1/>
		        <#else>  
		            <#assign end = totalPages/>  
		        </#if>
		          
		        <#assign pages=start..end/>  
		        <#list pages as page>  
		            <#if page==currentPage>  
		                <li class="active"><a href="javascript:void(0);" onclick="turnPage('0','${formId}','${page}')">${page}</a></li> 
		            <#else>  
		                <li><a href="javascript:void(0);" onclick="turnPage('0','${formId}','${page}')">${page}</a></li>
		            </#if>  
		        </#list>
		        <#if currentPage==totalPages || totalPages==0>  
		        	<li class="disabled"><a href="#">&raquo;</a></li>
		        	<li class="disabled"><a href="#"><@spring.message "last.page" /></a></li>
		        <#else>
		            <li><a href="javascript:void(0);" onclick="turnPage('1','${formId}','${currentPage}')">&raquo;</a></li>
		            <li><a href="javascript:void(0);" onclick="turnPage('0','${formId}','${totalPages}')"><@spring.message "last.page" /></a></li>
		        </#if>
	        </ul>
	    </div>
	    <div class="form-group">
	       <span><@spring.message "show" /></span>
	    </div>
	    <div class="form-group">
	        <select id="pageLimit" onchange="turnPage('0','${formId}','1')" class='select3 form-control input-sm' style="width:55px;">     
		        <#list pageSizeList as pageSize>
		             <#if pageLimit == pageSize>
		                  <option selected="selected" value="${pageSize}">${pageSize}</option>
		             <#else>
		                  <option value="${pageSize}">${pageSize}</option>
		             </#if>
		        </#list>
		    </select>
	    </div>
	    <div class="form-group">
	       <@spring.message "row" />
	       <span class="separator"></span>
	       <span><@spring.message "total" /></span> <span id="totalPages" class='jiufang_color5'>${totalPages!'0'}</span> <span><@spring.message "page" /></span> 
	       <span class="separator">|</span>
	       <span id="totalRecords" class='jiufang_color5'>${totalRecords!'0'}</span> <span><@spring.message "x.records" /></span>
	    </div>
	    
     </form>
  </div>
</#macro>
<script>
    $(function () {
        $(".select3").select2({
            minimumResultsForSearch: Infinity
        });
    })
    function goToPage(event, formId) {
        var e = event ? event : window.event;
        if (e.keyCode == 13) {
            var currentPage = $("#currentPage").val();
            var totalPages = $("#totalPages").html().trim();
            if (!currentPage || isNaN(currentPage) || currentPage < 1) {
                currentPage = 1
            } else if (currentPage > totalPages) {
                currentPage = totalPages;
            } else {
                currentPage = parseInt(currentPage);
            }
            var pageLimit = $("#pageLimit").val();
            changePage(formId, currentPage, pageLimit);
        }
    }

    function turnPage(flag, formId, currentPage) {
        var pageLimit = $("#pageLimit").val();
        currentPage = parseInt(currentPage) + parseInt(flag);
        changePage(formId, currentPage, pageLimit);
    }

    function changePage(formId, currentPage, pageLimit) {
        if (!formId) {
            return false;
        }
        var formObj = document.getElementById(formId);
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