
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Bean.BeanCategoria"%>
<%@page import="modelo.Dao.DaoCategoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="encabezado.jsp"></jsp:include>

        <h1>Registrar Vehículo</h1>

        <form method="post" action="Vehiculo">
            <table>
                <tr>
                    <th>
                        <label for="placa">Placa</label>
                        <input type="text" name="placa" class="form-control" required>
                        <label for="datos">Vendedor</label>
                        <input type="text" name="datos" class="form-control" required>
                        <label for="categoria">Categoria</label>
                        <select name="categoria" class="form-control" required>
                            <option value="">Seleccione Categoria</option>
                            <%for(BeanCategoria bcat : DaoCategoria.consultar()){%>
                            <option value="<%=bcat.getCatid()%>"><%=bcat.getCattip()%></option>
                            <%}%>
                        </select>
                        
                        <label for="modelo">Modelo</label>
                        <input type="text" name="modelo" class="form-control" required>
                        <label for="marca">Marca</label>
                        <input type="text" name="marca" class="form-control" required>
                        <label for="estado">Estado</label>
                        <input type="text" name="estado" class="form-control" required>
                        <label for="precio">Precio</label>
                        <input type="text" name="precio" class="form-control" required>
                    </th>

                </tr>

            </table><br><br>
            <button type="submit" class="btn btn-primary">Registrar</button>
            <input type="hidden" value="1" name="opcion">
        </form>
        <a href="menu.jsp" class="btn btn-danger">Atrás</a>
        
         </center>
        <% if (request.getAttribute("error") != null) { %>
        ${error}
        <% } else {%>
        ${exito}
        <%}%>

<jsp:include page="pie.jsp"></jsp:include>
<script>
    $(document).ready(function(){
        $("title").html("Registrar Vehiculos");
        $("#rVehiculo").addClass("active");
    });
</script>
