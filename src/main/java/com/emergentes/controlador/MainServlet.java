package com.emergentes.controlador;

import com.emergentes.modelo.Productos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op=request.getParameter("op");
        Productos objproducto=new Productos();
            int id,pos;
            HttpSession ses =request.getSession();
            ArrayList<Productos>lista=(ArrayList<Productos>)ses.getAttribute("listaproducto");
            switch(op){
                case "nuevo":
                    //enviar un objeto vacio
                    request.setAttribute("miobjproducto", objproducto);
                    request.getRequestDispatcher("editar.jsp").forward(request, response);
                    
                    break;
                case "editar":
                    // enviar un objeto a editar pero con contenido
                    id=Integer.parseInt(request.getParameter("id"));
                    pos=buscarPorIndice(request,id);
                    //obtenr objeto
                    objproducto=lista.get(pos);
                    request.setAttribute("miobjproducto", objproducto);
                    request.getRequestDispatcher("editar.jsp").forward(request, response);
                    break;
                case "eliminar":
                    //eliminar el registro de la coleccion segun el id
                     id=Integer.parseInt(request.getParameter("id"));
                    pos=buscarPorIndice(request,id);
                    if(pos>=0){
                        lista.remove(pos);
                    }
                    request.setAttribute("listaproducto", lista);
                    response.sendRedirect("index.jsp");
                    break;
                default:
                
            }        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        HttpSession ses=request.getSession();
        ArrayList<Productos> lista=(ArrayList<Productos>)ses.getAttribute("listaproducto");
        Productos objproducto=new Productos();
        objproducto.setId(id);
        objproducto.setDescripcion(request.getParameter("descripcion"));
        objproducto.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
        objproducto.setPrecio(Double.parseDouble(request.getParameter("precio")));
        objproducto.setCategoria(request.getParameter("categoria"));
                     
        if(id==0){
            //Nuevo registro
            int idNuevo=obtenerId(request);
            objproducto.setId(idNuevo);
            lista.add(objproducto);
            
        }else{
            // edicion de registro
            int pos=buscarPorIndice(request,id);
            lista.set(pos, objproducto);
            
        }
        request.setAttribute("listaproducto", lista);
        response.sendRedirect("index.jsp");
    }
    
    public int buscarPorIndice(HttpServletRequest request, int id){
        HttpSession ses=request.getSession();
        ArrayList<Productos>lista=(ArrayList<Productos>)ses.getAttribute("listaproducto");
        int pos=-1;
        if(lista !=null){
            for(Productos ele:lista){
                ++pos;
                if(ele.getId()==id){
                    break;
                }
            }
        }
        return pos;
        
    }
    
    public int obtenerId(HttpServletRequest request){
        HttpSession ses=request.getSession();
        ArrayList<Productos>lista=(ArrayList<Productos>)ses.getAttribute("listaproducto");
        // bucar el ultimo id
        int idn=0;
        for(Productos ele:lista){
            idn=ele.getId();
            
        }
        return idn +1;
    }        

}


