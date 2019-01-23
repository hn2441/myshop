<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>delete.jsp</title>
</head>
<body>
<%
	String productId = request.getParameter("no");
	int no=1;
	if(productId == null || productId.trim() == ""){
	%>
		<jsp:forward page="delete_html.jsp"></jsp:forward>
	<%
	}else{
		no=Integer.parseInt(productId);
	}
	
	ProductDAO dao = new ProductDAO();
	int rs = dao.delete(no);
	
	if(rs==1){
	%>
		<script type="text/javascript">
			alert("삭제 성공!");
		</script>
		<jsp:forward page="homepage.jsp"></jsp:forward>	
	<%
	}else{
	%>
		<script type="text/javascript">
			alert("삭제 실패!");
		</script>
		<jsp:forward page="delete_html.jsp"></jsp:forward>	
	<%
	}
	
	
%>
</body>
</html>