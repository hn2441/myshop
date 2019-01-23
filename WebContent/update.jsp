<%@page import="java.util.Enumeration"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>update.jsp</title>
</head>
<body>
	<%
		String productId = (String) session.getAttribute("no");
		int no = 1;
		if (productId == null || productId.trim() == "") {
	%>
	<script type="text/javascript">
		alert("존재하지 않는 아이디 입니다.");
	</script>
	<jsp:forward page="update_html.jsp"></jsp:forward>
	<%
		} else {
			no = Integer.parseInt(productId);
		}

		ProductDAO dao = new ProductDAO();
		ProductDTO dto = dao.select(no);

		int rs = 0;

		//넘어온 값이 있는 경우에만 새로 넣어주기
		String title = request.getParameter("title");
		dto.setTitle(title);

		String content = request.getParameter("content");
		dto.setContent(content);

		String price = request.getParameter("price");
		dto.setPrice(Integer.parseInt(price));
		
		dto.setNo(no);

		rs = dao.update(dto);
		if (rs == 1) {
			session.removeAttribute("no");
			response.sendRedirect("homepage.jsp");
		} else {
			response.sendRedirect("update_html.jsp");
		}
	%>

</body>
</html>