<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="xdi2.core.ContextNode" %>
<%@ page import="xdi2.core.LiteralNode" %>
<%@ page import="xdi2.core.util.XDIAddressUtil" %>
<%@ page import="xdi2.core.syntax.XDIAddress" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<title>HIIT DiMe People Finder</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="UTF-8"> 

<link rel="stylesheet" type="text/css" href="style.css"> 
 
</head>

<body>

<h1>People Finder</h1>

<%
	List<ContextNode> list = (List<ContextNode>) request.getAttribute("list");
%>

<% for (ContextNode contextNode : list) { %>

	<div style="border:2px solid black; margin:10px; padding:10px;">

 		<img src="/images/logo-dime.jpg" style="float:right" height="60">
 
		<div style="float:right;""><input style="padding:10px" type="button" value="Connect"></div>

		<p><b>XDI Address:</b> <%= contextNode.getXDIAddress() %></p>

		<% for (LiteralNode l : contextNode.getAllLiteralNodes()) { %>
		
			<b><%= XDIAddressUtil.localXDIAddress(l.getContextNode().getXDIAddress(), -1) %></b>:&nbsp;<%= l.getLiteralData() %><br>
		<% } %>

	</div>

<% } %>

</body>

</html>
