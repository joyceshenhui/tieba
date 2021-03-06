<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=utf-8">
<title>首页</title>
<base href="${deployName}">
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="css/index0.css" id="cssfile"/>

</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default" role="navigation" id="topnav">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span><span
								class="icon-bar"></span><span class="icon-bar"></span><span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">爱贴就上贴吧</a>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav" id="shouye">
							<li class="active"><a href="#">首页</a></li>
						</ul>
						<form id="searchForm" action="searchPage.jsp" class="navbar-form navbar-left" role="search">
							<div class="form-group">
								<input name="page" id="page" type="hidden" value="1"/>
								<input name="param" id="param" class="form-control" type="text" style="width: 400px" />
							</div>
							<button type="submit" class="btn btn-default">搜索</button>
						</form>
						<ul class="nav navbar-nav navbar-right">
							<c:choose>
								<c:when test="${loginUser!=null}">
									<li><img class="img-circle" id="picPath" src="images/mr.jpg"></li>
									<li><a href="#" id="uname"></a></li>
									<input id="userid" type="hidden" value="${loginUser.userid}">
								</c:when>
								<c:otherwise>
									<li><a href="register.jsp">注册</a></li>
									<li><a href="login.jsp">登录</a></li>
								</c:otherwise>
							</c:choose>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">更多<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<c:choose>
										<c:when test="${loginUser !=null}">
											<li><a href="page/personal.jsp">个人中心</a></li>
											<li><a href="#">消息中心</a></li>
											<li><a href="#">系统消息</a></li>
											<li class="divider"></li>
											<li><a href="exit.jsp">退出登录</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="#">个人中心</a></li>
											<li><a href="#">消息中心</a></li>
											<li><a href="#">系统消息</a></li>
										</c:otherwise>
									</c:choose>
								</ul></li>
							<!-- 一键换肤 -->	
							<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">一键换肤<strong class="caret"></strong></a>
								<ul class="dropdown-menu" id="skin">
									<li id="index0" title="经典" class="selected"><a href="#">经典主题</a></li>
									<li id="index1" title="粉色" ><a href="#">粉色主题</a></li>
									<li id="index2" title="蓝色" ><a href="#">蓝色主题</a></li>
								</ul>
							</li>
						</ul>

					</div>
				</nav>
				<div class="carousel slide" id="carousel-204734">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0"
							data-target="#carousel-204734"></li>
						<li data-slide-to="1" data-target="#carousel-204734"></li>
						<li data-slide-to="2" data-target="#carousel-204734"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img id="picChange" alt="" src="images/bg3.jpg" />
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="item">
							<img id="picChange" alt="" src="images/bg5.jpg" />
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="item">
							<img id="picChange" alt="" src="images/bg6.jpg" />
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-204734"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#carousel-204734"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			</div>
		</div>
		<div class="row clearfix" style="margin-top: 40px">
			<div class="col-md-3 column">
				<p id="pstyle">贴吧分类</p>
				<ul id="ulstyle">
				</ul>
			</div>
			<!-- <div class="col-md-6 column"> -->
			<div class="col-md-6 column" id="center">
				<!-- 主页的帖子显示div -->
				<form method="post" id="collectFrom" enctype="multipart/form-data">
					<input type="hidden" id="userid" name="userid"
						value="${loginUser.userid}">
				</form>
				<div id="indexNoteContent"></div>
			</div>
			<div class="col-md-3 column">
				<p id="pstyle">帖子热议榜</p>
				<div id="olstyle">
					<ol id="hot"></ol>
				</div>

				<p id="pstyle">帖子推荐</p>
				<div id="sendNotes"></div>
			</div>
		</div>
		<div class="row clearfix" id="footerstyle">
			<div class="col-md-12 column" id="footerbody">
				<p class="text-center" id="pfooter">@2017 联系方式：11111111111</p>
				<p class="text-center" id="pfooter">邮箱：joy@163.com</p>
			</div>
		</div>
	</div>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="js/searchPage.js"></script>
</body>
</html>
