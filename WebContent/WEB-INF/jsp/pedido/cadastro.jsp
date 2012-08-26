<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de Pedidos</title>

<script>

var jQ = jQuery.noConflict();
var count = -1;

function additem(){
	count++;
	jQ("#itemlist").show();
	var desc = jQ("#descricao").val();
	var qtd = jQ("#quantidade").val();
	var vu = jQ("#valorUni").val();
	jQ("#descricao").val("");
	jQ("#quantidade").val("");
	jQ("#valorUni").val("");
	if (count%2 == 0)
		jQ("#tbitemlist").append("<tr class='linha1'> <td><input type='hidden' name='pedido.lista["+count+"].descricao' value='"+desc+"'>"+desc+"</td><td><input type='hidden' name='pedido.lista["+count+"].quantidade' value="+qtd+">"+qtd+"</td><td><input type='hidden' name='pedido.lista["+count+"].valorUni' value="+vu+">"+vu+"</td></tr>");
	else
		jQ("#tbitemlist").append("<tr class='linha2'> <td><input type='hidden' name='pedido.lista["+count+"].descricao' value='"+desc+"'>'"+desc+"</td><td><input type='hidden' name='pedido.lista["+count+"].quantidade' value="+qtd+">"+qtd+"</td><td><input type='hidden' name='pedido.lista["+count+"].valorUni' value="+vu+">"+vu+"</td></tr>");

}

</script>

</head>
<body>
<form action="adiciona">
	<center><br>
	<p class="texto1">Adicionar Pedido</p>
			<br>
			<br>
		<label for="cliente">Cliente:</label>
			<input id="cliente" type="text" name="pedido.cliente" maxlength="255" />
			<br>
			<br>
		<label for="data">Data:</label>
			<input id="data" type="text" name="pedido.data" maxlength="10" size="10"/>
			<br>
			<br>			
			<hr>
			
		<p class="texto1">Itens</p>
			<br>
			<br>			
		<div id="itemlist" style="display:none;">
			<table>
				<thead>
				<tr class="theader1">				
				<td style="width:60%;">Item</td>
				<td style="width:20%;">Quantidade</td>
				<td style="width:20%;">Unitário</td>
				</tr>
				</thead>
				<tbody id="tbitemlist">
				</tbody>
			</table>
			<br><br>
			</div>
			<label for="descricao">Item:</label>
			<input id="descricao" type="text" maxlength="255" /><br><br>
			<label for="quantidade">Quantidade:</label>
			<input id="quantidade" type="text" maxlength="11" size="11" /><br><br>
			<label for="valorUni">Unitário:</label>
			<input id="valorUni" type="text" maxlength="11" size="11" />
			
			<br>
			<br>	
			<input type="button" value="Adicionar item" onClick="additem();">
					
			<br>
			<br>
		<button type="submit">Enviar</button>
	</center>
	
</form>
</body>
</html>