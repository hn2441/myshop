<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="wrapper">
	<%
		ProductDAO dao = new ProductDAO();
		ProductDTO dto = new ProductDTO();
		
		ArrayList<ProductDTO> list = dao.selectAll();
	%>
	<div id="portfolio" class="container">
	<% for(int i=list.size(); i>0 ;i--){ 
			dto=list.get(i-1);			%>
		<div class="column1">
			<div class="box"> <a href="select.jsp?no=<%=dto.getNo()%>">
				<h3><%=dto.getTitle() %></h3>
				<% 	String content =dto.getContent();
					if(dto.getContent().length()>50){
							
						for(int j=0; j<50;j++){ 
							content+=(dto.getContent()).charAt(j);
							if(j==dto.getContent().length()){
								break;
							}//end inner if
						}//end inner for
						content += "...";
					}//end outer if
				%>
				<p><%=content%></p>
				<a href="select.jsp?no=<%=dto.getNo() %>" class="button button-small">상품 보러가기</a> </div>
		</div>
	<%} %>
	</div>
</div>
