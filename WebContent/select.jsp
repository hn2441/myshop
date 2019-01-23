<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>
<%@include file="header2.jsp"%>

<%
	String productId = request.getParameter("no");
	int no = 1;
	if (productId == null || productId.trim() == "") {

	} else {
		no = Integer.parseInt(productId);
	}

	ProductDAO dao = new ProductDAO();
	ProductDTO dto = dao.select(no);
%>

<div id="page-wrapper">
	<div id="page" class="container">
		<div class="title">
			<h2>select.jsp</h2>
		</div>
	</div>
</div>
<div class="wrapper">
	<div>
		<form action="#">
			<table style="width: 80%;">
				<tr>
					<td style="width: 20%; text-align: center;"><p>T I T L E</p></td>
					<td style="width: 80%; height: 30px;"><input type="text"
						name="title" id="title" value="<%=dto.getTitle() %>" readonly="readonly"
						style="width: 100%; height: 100%; text-align: left"></input></td>
				</tr>
				<tr>
					<td style="text-align: center;"><p>C O N T E N T</p></td>
					<td style="width: 80%; text-align: left">
						<textarea name="content" id="content" style="width: 100%; height: 90%;"
						readonly="readonly"><%=dto.getContent() %></textarea>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;"><p>P R I C E</p></td>
					<td style="text-align: left"><img alt="" src="images/won.png" style="width: 3%"> 
						<input type="number" name="price" id="price" style="width: 15%; height: 30px;"
						value="<%=dto.getPrice()%>">
						</input></td>
				</tr>
				<tr>
					<td colspan="2" style="width: 100%; height: 30px;"></td>
				</tr>
			</table>
		</form>
	</div>
</div>

<%@include file="footer.jsp"%>
