<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listagem de pedidos</title>
<script>
	var jQ = jQuery.noConflict();
	
	jQ("#tb").ready( function(){
		jQ("#tb").children("tr:even").addClass("linha1");
		jQ("#tb").children("tr:odd").addClass("linha2");
	});
	
	function mostra(x){
		jQ("#pedidoid").val(x);
		jQ("#pedidocliente").val(jQ("#cliente"+x).val());
		jQ("#pedidodata").val(jQ("#data"+x).val());
		jQ("#pedidolista").val(jQ("#lista"+x).val());
		jQ("#pedidoqntItens").val(jQ("#qntItens"+x).val());
		jQ("#pedidototal").val(jQ("#total"+x).val());
		jQ("#formdetalhes").submit();
	}
	
</script>
</head>
<body>

	<center><br>
	<p class="texto1">
	Listagem dos pedidos</p>
	<br><br>	
	<table>
		<thead>
			<tr class="theader1">
				<th style="width:40%;">Cliente</th>
				<th style="width:10%;">Data</th>
				<th style="width:25%;">Quantidade de Itens</th>
				<th style="width:25%;">Valor total</th>
			</tr>
		</thead>
		<tbody id="tb">
			<c:forEach items="${pedidoList}" var="pedido">
			<input type="hidden" id="id${pedido.id}" value="${pedido.id}">
			<input type="hidden" id="cliente${pedido.id}" value="${pedido.cliente}">
			<input type="hidden" id="data${pedido.id}" value="${pedido.data}">
			<input type="hidden" id="lista${pedido.id}" value="${pedido.lista}">
			<input type="hidden" id="qntItens${pedido.id}" value="${pedido.qntItens}">
			<input type="hidden" id="total${pedido.id}" value="${pedido.total}">
			<tr id="${pedido.id}">
			<td><a href="javascript:void(0)" onclick="mostra(${pedido.id});">${pedido.cliente }</a></td>
			<td><a href="javascript:void(0)" onclick="mostra(${pedido.id});">${pedido.data }</a></td> 
			<td><a href="javascript:void(0)" onclick="mostra(${pedido.id});">${pedido.qntItens }</a></td>
			<td><a href="javascript:void(0)" onclick="mostra(${pedido.id});">${pedido.total }</a></td> 
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</center>
	<form id="formdetalhes" action="detalhes">
	<input type="hidden" id="pedidoid" name="pedido.id">	
	<input type="hidden" id="pedidocliente" name="pedido.cliente">
	<input type="hidden" id="pedidodata" name="pedido.data">
	<input type="hidden" id="pedidolista" name="pedido.lista">
	<input type="hidden" id="pedidoqntItens" name="pedido.qntItens">
	<input type="hidden" id="pedidototal" name="pedido.total">
	</form>
</body>
</html>