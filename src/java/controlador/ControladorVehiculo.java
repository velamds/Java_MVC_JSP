/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Bean.BeanVehiculo;
import modelo.Dao.DaoVehiculo;

/**
 *
 * @author Sergio Munoz
 */
@WebServlet(name = "ControladorVehiculo", urlPatterns = {"/Vehiculo"})
public class ControladorVehiculo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        int opcion = Integer.parseInt(request.getParameter("opcion"));
        String placa = request.getParameter("placa");
        String datos = request.getParameter("datos");
        String categoria = request.getParameter("categoria");
        String modelo = request.getParameter("modelo");
        String marca = request.getParameter("marca");
        String estado = request.getParameter("estado");
        String precio = request.getParameter("precio");

        BeanVehiculo bVehiculo = new BeanVehiculo(placa, datos, categoria, modelo, marca, estado, precio);
        DaoVehiculo dVehiculo = new DaoVehiculo(bVehiculo);

        switch (opcion) {

            case 1: //Agregar Registro
                if (dVehiculo.AgregarRegistro()) {
                    request.setAttribute("exito", "<script>alert('El vehículo  fue registrado correctamente')</script>");
                } else {
                    request.setAttribute("error", "<script>alert('El vehículo  no pudo ser registrado')</script>");
                }
                request.getRequestDispatcher("registrar_vehiculo.jsp").forward(request, response);
                break;

            case 2: // Actualizar Registro
                if (dVehiculo.ActualizarRegistro()) {

                    request.setAttribute("exito", "<script>alert('El vehículo  fue Actualizado  correctamente')</script>");

                } else {

                    request.setAttribute("error", "<script>alert('El vehículo  no pudo ser Actualizado')</script>");

                }
                request.getRequestDispatcher("menu.jsp").forward(request, response);
                break;
                
            case 3:
                BeanVehiculo BVehiculo = DaoVehiculo.consultarPorPlaca(placa);
                if (BVehiculo != null) {
                    
                    request.setAttribute("beanlleno",BVehiculo);
                    
                    
                }
            break;
            case 4:
                request.getRequestDispatcher("menu.jsp").forward(request, response);
                break;
            
            case 5:
                request.getRequestDispatcher("actualizar_vehiculo.jsp").forward(request, response);
                break;    

        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
