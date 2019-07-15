<footer class="alert alert-info" align="center"><p>Elaborado por <strong>Sergio Munoz Vela</strong> Para el SENA</p></footer>
        </main>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
    
    <script src="assets/js/jquery-3.1.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/datatables.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function() {

           $('#Pedidos').DataTable( {
                "order": [[ 5, "desc" ]],
                "lengthMenu": [[5, 12, 25, -1], [5, 12, 25, "Todo"]],
                 "language": {
                "lengthMenu": "Mostrar _MENU_ registros por pagina",
                "zeroRecords": "Nada encontrado, lo siento",
                "info": "Mostrando pagina _PAGE_ de _PAGES_",
                "infoEmpty": "No hay registros para mostrar",
                "infoFiltered": "(Filtrado de _MAX_ registros totales)",
                "decimal":        "",
                "emptyTable":     "No data available in table",                
                "infoEmpty":      "Mostrando 0 a 0 de 0 entradas",
                "infoFiltered":   "(filtrado de _MAX_ entradas totales)",
                "infoPostFix":    "",
                "thousands":      ",",
                "lengthMenu":     "Mostrar _MENU_ entradas",
                "loadingRecords": "Cargando...",
                "processing":     "Procesando...",
                "search":         "Buscar:",
                "zeroRecords":    "No se encontraron conincidencias",
                "paginate": {
                    "first":      "Primera",
                    "last":       "Última",
                    "next":       "Siguiente",
                    "previous":   "Anterior"
                },
                "aria": {
                    "sortAscending":  ": activar para ordenar columna ascendente",
                    "sortDescending": ": activar para ordenar columna descendente"
                }
            }
            

            });
      } );
    </script>
  </body>
</html>