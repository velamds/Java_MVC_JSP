<%-- 
    Document   : consultar_vehiculos
    Created on : 18-may-2018, 17:15:40
    Author     : Instructor
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Dao.DaoVehiculo"%>
<%@page import="modelo.Bean.BeanVehiculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehículos</title>
    </head>
    <body>

    <center>
        <h1>VEHÍCULOS</h1>

        <form method="post" action="Vehiculo">
            <table border="1">
                <tr>
                    <th>
                        Ingrese la Placa<br>
                        <input type="text" name="placa"><br>

                    </th>
                </tr>

            </table> <br>  
            <button>Consultar</button>
            <input type="hidden" value="3" name="opcion">

        </form>
        <form method="post" action="Vehiculo" name="fo1">

            <table border="1">
                <tr>
                    
                    <td> PLACA</td>

                    <td>   VENDEDOR</td>

                    <td>   CATEGORÍA</td>

                    <td>   MODELO</td>

                    <td>   MARCA</td>

                    <td>  ESTADO</td>

                    <td>  PRECIO</td>



                </tr>

                <%
                    BeanVehiculo bvehiculo = new BeanVehiculo();
                    DaoVehiculo dvehiculo = new DaoVehiculo(bvehiculo);

                    ArrayList<BeanVehiculo> listarVehiculos = dvehiculo.listar();
                    for (int i = 0; i < listarVehiculos.size(); i++) {
                        bvehiculo = listarVehiculos.get(i);
                %>

                <tr>
                    <td><%=bvehiculo.getVehPlaca()%></td>
                    <td><%=bvehiculo.getDatId()%></td>
                    <td><%=bvehiculo.getCatId()%></td>
                    <td><%=bvehiculo.getVehModelo()%></td>
                    <td><%=bvehiculo.getVehMarca()%></td>
                    <td><%=bvehiculo.getVehEstado()%></td>
                    <td><%=bvehiculo.getVehPrecio()%></td>

                </tr>
                <% } %>

            </table><br><br>

        </form>

    </center>
    <% if (request.getAttribute("error") != null) { %>
    ${error}
    <% }%>

</body>
</html>
