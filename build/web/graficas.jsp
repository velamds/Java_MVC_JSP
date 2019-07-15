<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Dao.DaoVehiculo"%>
<%@page import="modelo.Bean.BeanGraficaVeh"%>
<jsp:include page="encabezado.jsp"></jsp:include>
<link rel="stylesheet" href="assets/morris.css">

<section class="container">
    <article class="col-sm-12" id="migrafica" style="height: 250px;">
        
    </article>
</section>

<jsp:include page="pie.jsp"></jsp:include>
<script src="assets/raphael-min.js"></script>
<script src="assets/morris.min.js"></script>
<% 
    DaoVehiculo dv = new DaoVehiculo();

    ArrayList<BeanGraficaVeh> lista = dv.listarGraVeh();
%>
<script>
    $(document).ready(function () {
        lista = [];
        <% for(BeanGraficaVeh l : lista){%>
           lista.push({year:'<%=l.getEstado()%>' , value:parseInt(<%=l.getCantidad()%>)}); 
        <% } %>
       
    new Morris.Line({
        // ID of the element in which to draw the chart.
        element: 'migrafica',
        // Chart data records -- each entry in this array corresponds to a point on
        // the chart.
        data: lista,
        // The name of the data record attribute that contains x-values.
        xkey: 'year',
        // A list of names of data record attributes that contain y-values.
        ykeys: ['value'],
        // Labels for the ykeys -- will be displayed when you hover over the
        // chart.
        labels: ['Value']
      });
    });
</script>