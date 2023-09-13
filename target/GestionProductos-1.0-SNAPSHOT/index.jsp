<%@page import="com.emergentes.modelo.Productos"%>
<%@page import="java.util.ArrayList"%>
<% 
    if(session.getAttribute("listaproducto")==null){
        ArrayList<Productos>lisaux=new ArrayList<Productos>();
        session.setAttribute("listaproducto", lisaux);
    }
    ArrayList<Productos>lista=(ArrayList<Productos>)session.getAttribute("listaproducto");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            div{
                border: 2px solid black;
                width: 450px;
                height: 150px;
                text-align: left;
                padding-left: 10px;
                border-radius: 5px
            }
            h3{
                text-indent: 10%;
            }
            p{
                text-indent: 10%;
            }
        </style>
    </head>
    <body>
        <center>
            <div>
                <h3>PRIMER PARCIAL TEM - 742</h3>
                <p>Nombre: Marco Antonio Tarqui Alancoa</p>
                <p>Carnet: 6018702</p><br>
            </div>
            <h1>Gestion de productos</h1>
        <a href="MainServlet?op=nuevo">Nuevo producto</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Descripcion</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Categoriar</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
            <%
                if(lista !=null){
                    for(Productos item: lista){ 
            %>
            <tr>
                <td><%=item.getId()%></td>
                <td><%=item.getDescripcion()%></td>
                <td><%=item.getCantidad()%></td>
                <td><%=item.getPrecio()%></td>
                <td><%=item.getCategoria()%></td>
                <td>
                    <a href="MainServlet?op=editar&id=<%=item.getId()%>">Editar</a>
                </td>
                <td>
                    <a href="MainServlet?op=eliminar&id=<%=item.getId()%>" onclick="return(confirm('Esta seguro de eliminar??'))">Eliminar</a>
                </td>
            </tr>
            <%  
                    }
                }
            %>
        </tablez>
        </center>
    </body>
</html>
