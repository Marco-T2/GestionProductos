<%@page import="com.emergentes.modelo.Productos"%>
<%
    Productos reg=(Productos)request.getAttribute("miobjproducto");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de producto</title>
        <style>
            .id,.tarea{
                width: 200px;
                height: 30px;
            }
            .id1,.ta2,.co3{
                font-size: 15px;
                text-align: right;
                padding-right: 10px;
            }
            .registrar{
                color:#FEFFFF;
                font-size: 20px;
                background-color:brown;
                border-color: tomato;
                border-width: 3px;
                border-style: solid;         
            }
        </style>
    </head>
    <body>
        <center>
        <h1>Registro de Producto</h1>
        <form action="MainServlet" method="post">
            <table>
                <tr>
                    <td class="id1">ID</td>
                    <td> <input class="id" type="text" name="id" value="<%=reg.getId()%>" size="2" readonly> </td>
                </tr>
                <tr>
                    <td class="ta2"> Descripcion </td>
                    <td> <input class="tarea" type="text" name="descripcion" value="<%=reg.getDescripcion()%>" > </td>
                </tr>
                <tr>
                    <td class="co3">Cantidad</td>
                    <td> <input class="tarea" type="text" name="cantidad" value="<%=reg.getCantidad()%>" > </td>
                </tr
                <tr>
                    <td class="co3">Precio</td>
                    <td> <input class="tarea" type="text" name="precio" value="<%=reg.getPrecio()%>" > </td>
                </tr
                <tr>
                    <td class="co3">Categoria</td>
                    <td> <input class="tarea" type="text" name="categoria" value="<%=reg.getCategoria()%>" > </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input class="registrar" type="submit" value="Registrar"></td>
                </tr>
            </table>
        </form>
        
        </center>
    </body>
</html>
