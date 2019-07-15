<%@page import="modelo.Dao.DaoCategoria"%>
<%@page import="modelo.Bean.BeanVehiculo"%>
<%@page import="modelo.Dao.DaoVehiculo"%>
<jsp:include page="encabezado.jsp"></jsp:include>
          <h2>Vehiculos</h2>
          <div class="table-responsive">
            <table class="table table-striped" id="Pedidos">
              <thead>
                <tr>
                  <th>Placa</th>
                  <th>Marca</th>
                  <th>Estado</th>
                  <th>Precio</th>
                  <th>Modelo</th>
                  <th>Categoria</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
              <%    
                  DaoVehiculo DaoVeh = new DaoVehiculo();
                  for (BeanVehiculo ObjVeh : DaoVeh.listar()){%>
                <tr>
                  <td><%=ObjVeh.getVehPlaca() %></td>
                  <td><%=ObjVeh.getVehMarca() %></td>
                  <td><%=ObjVeh.getVehEstado() %></td>
                  <td><%=ObjVeh.getVehPrecio() %></td>
                  <td><%=ObjVeh.getVehModelo() %></td>
                  <td><%=DaoCategoria.consultaPorId(ObjVeh.getCatId()) %></td>
                  <td><a href="Vehiculo?opcion=5&placa=<%=ObjVeh.getVehPlaca()%>" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span>E</a></td>    
                </tr>
                <% } %>
                <!-- Modal -->
<div id="Modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><?=$tipo?></h4>
      </div>
      <div class="modal-body">
        <p><strong>Pedido:</strong> <?=$tipo." - ".$desc?></p>
        <p><strong>Cliente:</strong> <?=$nombre?></p>
        <p><strong>Precio:</strong> $<?=$precio?></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
      </div>
    </div>

  </div>
</div>
<!--endmodal-->
              <?php endwhile;?>
              </tbody>
            </table>
          </div>
<jsp:include page="pie.jsp"></jsp:include>
<script>
    $(document).ready(function(){
        $("title").html("Menu Principal");
        $("#Inicio").addClass("active");
    });
</script>
