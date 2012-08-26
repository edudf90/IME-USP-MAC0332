<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detalhes do Pedido</title>
<script>

var jQ = jQuery.noConflict();

jQ("#tb").ready( function(){
	jQ("#tb").children("tr:even").addClass("linha1");
	jQ("#tb").children("tr:odd").addClass("linha2");
});
</script>
</head>
<body>

	<center><br>
	<p class="texto1">Detalhes do Pedido</p>
			<br>
			<br>
		<label for="cliente">Cliente:</label>
			<input readonly="readonly" type="text" name="pedido.cliente" value="${pedido.cliente}" />
			<br>
			<br>
		<label for="data">Data:</label>
			<input readonly="readonly" type="text" name="pedido.data" value="${pedido.data}" size="10"/>
			<br>
			<br>			
			<hr>
			
		<p class="texto1">Itens</p>
			<br>
			<br>			
		<div id="itemlist">
			<table>
				<thead>
				<tr class="theader1">
				<td style="width:40%;">Item</td>
				<td style="width:20%;">Quantidade</td>
				<td style="width:20%;">Unitário</td>
				<td style="width:20%;">Valor Total</td>
				</tr>
				</thead>
				<tbody id="tb">
				<c:forEach items="${pedido.lista }" var="item">
					<tr id="${item.id}">
					<td>${item.descricao}</td>
					<td>${item.quantidade}</td>
					<td>${item.valorUni}</td>
					<td>${item.total}</td>
				</c:forEach>
				</tbody>
			</table>
			</div>
	</center>
</body>
</html>