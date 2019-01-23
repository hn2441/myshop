<%@page import="java.util.Enumeration"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>isnert.jsp</title>
</head>
<body>
<%
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = new ProductDTO();;
	int rs = 0;
	try{
		
		//넘어온 값 받아오기
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		
		rs = dao.insert(dto);
		if(rs==1){
			response.sendRedirect("homepage.jsp");			
		}else{
			response.sendRedirect("insert_html.jsp");			
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>

</body>
</html>