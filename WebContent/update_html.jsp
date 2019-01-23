<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="header2.jsp" %>
<%@ include file="update.html"%>
<%	
	String no = request.getParameter("no"); 
	session.setAttribute("no", no);
%>
<%@ include file="footer.jsp" %>
