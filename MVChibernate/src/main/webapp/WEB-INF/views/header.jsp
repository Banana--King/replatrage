<header class="header dark-bg">
	<div class="toggle-nav">
		<div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
	</div>
	
	<a href="/SpringMVCHibernate/" class="logo">Hitema <span class="lite">Replâtrage</span></a>
	
	
	<div class="top-nav notification-row">                
		<!-- notification dropdown start-->
		<ul class="nav pull-right top-menu">
			<!-- user login dropdown start-->
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#">
					<span class="profile-ava"> <img alt="" src="<c:url value="/resources/img/avatar1_small.jpg" />"> </span>
					<span class="username"><sec:authentication property="name"/></span>
					<b class="caret"></b>
				</a>
				<ul class="dropdown-menu extended logout">
					<span class="log-arrow-up"></span>
					<li class="eborder-top">
					<a href="logout"><i class="icon_key_alt"></i> Log Out</a>
					</li>
				</ul>
			</li>
		<!-- user login dropdown end -->
		</ul>
	<!-- notification dropdown end-->
	</div>
</header>   