<%@page import="modelo.Bean.BeanVehiculo"%>
<%@page import="modelo.Dao.DaoVehiculo"%>
<%@page import="modelo.Dao.DaoCategoria"%>
<%@page import="modelo.Bean.BeanCategoria"%>
<jsp:include page="encabezado.jsp"></jsp:include>

<h1>Registrar Vehículo</h1>

        <form method="post" action="Vehiculo">
            <table>
                <tr>
                    <th>
                    <% BeanVehiculo BVeh = DaoVehiculo.consultarPorPlaca(request.getParameter("placa")); %>
                        PLACA<br>
                        <input type="text" name="placa" value="<%=BVeh.getVehPlaca()%>"><br><br>
                        VENDEDOR<br>
                        <input type="text" name="datos" value="<%=BVeh.getDatId()%>"><br><br>
                        CATEGORÍA<br>
                        <select name="categoria" required>
                            <option value="">Seleccione Categoria</option>
                            
                            <%for(BeanCategoria bcat : DaoCategoria.consultar()){%>
                            <option value="<%=bcat.getCatid()%>" <%=bcat.getCatid().equals(BVeh.getCatId()) ? "selected" : ""  %>>
                                <%=bcat.getCattip()%>
                            </option>
                            <%}%>
                        </select>
                        <br><br>
                        MODELO<br>
                        <input type="text" name="modelo" value="<%=BVeh.getVehModelo() %>"><br><br>
                        MARCA<br>
                        <input type="text" name="marca" value="<%=BVeh.getVehMarca() %>"><br><br>
                        ESTADO<br>
                        <input type="text" name="estado" value="<%=BVeh.getVehEstado() %>"><br><br>
                        PRECIO<br>
                        <input type="text" name="precio" value="<%=BVeh.getVehPrecio() %>"><br><br>
                    </th>

                </tr>

            </table><br><br>
            <button>Actualizar </button>
            <input type="hidden" value="2" name="opcion">
        </form>
        <a href="menu.jsp" >Atrás</a>
        
         </center>
        <% if (request.getAttribute("error") != null) { %>
        ${error}
        <% } else {%>
        ${exito}
        <%}%>

<jsp:include page="pie.jsp"></jsp:include>
<script>
    $(document).ready(function(){
        $("title").html("Actualizar Vehiculos");
        $("#rVehiculo").addClass("active");
    });
</script>