<#include "page/head.ftl"/>
<script type="text/javascript" src="${jsPath}login/login.js"></script>
 <style type="text/css">
     body {
	    font-family: 'Roboto', sans-serif;
	    font-size: 16px;
	    font-weight: 300;
	    color: #888;
	    line-height: 30px;
	    text-align: center;
	 }    
     .top-content .text{
         color: #fff;
     }
     .top-content .description{
         margin: 20px 0 10px 0;
     }
     .form-top {
	    overflow: hidden;
	    padding: 0 25px 15px 25px;
	    background: #fff;
	    -moz-border-radius: 4px 4px 0 0;
	    -webkit-border-radius: 4px 4px 0 0;
	    border-radius: 4px 4px 0 0;
	    text-align: left;
	}
	.form-box {
	    margin-top: 35px;
	}
	.form-bottom {
	    padding: 25px 25px 30px 25px;
	    background: #eee;
	    -moz-border-radius: 0 0 4px 4px;
	    -webkit-border-radius: 0 0 4px 4px;
	    border-radius: 0 0 4px 4px;
	    text-align: left;
	}
	.error_tips{
	   color:#a94442;
	   font-size: 85%;
	}
 </style>
<div class="top-content">
	 <div class="container">
	     <div class="row">
            <div class="col-sm-8 col-sm-offset-2 text">
                <h1><strong>ToFba</strong> Login Form</h1>
                <div class="description">
                	<p>
                    	做最好的物流，用心对待每一票货物
                	</p>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3 form-box">
                	<div class="form-top">
                		<div class="form-top-left">
                			<h3>Login to our site</h3>
                    		<p>Enter your username and password to log on:</p>
                		</div>
                		<div class="form-top-right">
                			<i class="fa fa-key"></i>
                		</div>
                    </div>
                    <div class="form-bottom">
	                    <span class='error_tips'>${error!''}</span>
	                    <form id="loginForm" role="form" action="login" method="post" class="login-form">
	                    	<div class="form-group">
	                    		<label class="sr-only" for="form-username">Username</label>
	                        	<input type="text" name="username" placeholder="Username..." class="form-username form-control" id="form-username">
	                        	<span class="glyphicon glyphicon-user form-control-feedback"></span>
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-password">Password</label>
	                        	<input type="password" name="password" placeholder="Password..." class="form-password form-control" id="form-password">
	                        	<span class="glyphicon glyphicon-lock form-control-feedback"></span>
	                        </div>
	                        <button type="submit" class="btn btn-primary" style="width:100%">Sign in!</button>
	                    </form>
                    </div>
                    
              </div>
        </div> 
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3 form-box">
                <h5>本系统不对IE8提供支持，请使用更高版本的IE，推荐使用Chrome、FireFox</h5>
            </div>
        </div>         
	 </div>
</div>

</div>
</body>
</html>