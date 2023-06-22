<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h4>Consulta Sala - Sebastian Torres </h4>
		<div class="row" style="margin-top: 5%">
				<div class="col-md-4">
					<label class="control-label" for="id_numero">Número de Sala</label>
				</div>
				<div class="col-md-5">
					<input	class="form-control" type="text" id="id_numero">
				</div>
		</div>
		<div class="row" style="margin-top: 1%">
				<div class="col-md-4">
					<label class="control-label" for="id_sede">Sede</label>
				</div>
				<div class="col-md-5">
					<select	class="form-control" id="id_sede">
						<option value="-1">[Seleccione]</option>
					</select>
				</div>
		</div>
		<div class="row" style="margin-top: 1%">
				<div class="col-md-4">
					<label class="control-label" for="id_estado">Estado</label>
				</div>
				<div class="col-md-5">
					<input type="checkbox" class="custom-control-input" id="id_estado" checked="checked" />
				</div>
		</div>
		<div class="row" style="margin-top: 1%">
				<div class="col-md-4">
					<label class="control-label" for="id_recursos">Recursos</label>
				</div>
				<div class="col-md-5">
					<input	class="form-control" type="text" id="id_recursos">
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-2">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtro</button>
				</div>
		</div>
		

		<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#337ab7; color:white'>
					<tr>
						<th>Código</th>
						<th>Numero de Sala</th>
						<th>Piso</th>
						<th>Numero de Alumnos</th>
						<th>Recursos</th>
						<th>Estado</th>
						<th>Sede</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>

		</div>
		
		
		<div class="modal fade" id="id_div_modal_ver" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span>Datos de la Sala</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idSala" id="idSala" >
			                   			<div class="panel-body">
			                            <div class="form-group" >
		                                    <label class="col-lg-3 control-label" for="id_act_numero">Número de Sala</label>
		                                    <div class="col-lg-8">
											<input class="form-control" id="id_act_numero" name="numero" type="text" readonly="readonly"/>
		                                     </div>
		                                 </div> 	
										 <div class="form-group">
		                                     <label class="col-lg-3 control-label" for="id_act_piso">Piso</label>
		                                     <div class="col-lg-8">
											 <input class="form-control" id="id_act_piso" name="piso" type="text" readonly="readonly"/>
		                                 </div>
		                                 </div> 	
		                                 <div class="form-group">
		                                      <label class="col-lg-3 control-label" for="id_act_numalum">Número de Alumnos</label>
		                                      <div class="col-lg-8">
											  <input class="form-control" id="id_act_numalum" name="numAlumnos" type="text" readonly="readonly"/>
		                                 </div>
		                                 </div> 
		                                 <div class="form-group">
		                                       <label class="col-lg-3 control-label" for="id_act_recursos">Recursos</label>
		                                       <div class="col-lg-8">
											   <input class="form-control" id="id_act_recursos" name="recursos" type="text" readonly="readonly"/>
		                                       </div>
		                                  </div>  	
		                                  <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-8">
												<select class="form-control" id="id_act_estado" name="estado" disabled="disabled">
																<option value=" ">[Seleccione]</option>
																<option value="1">Activo</option>
																<option value="0">Inactivo</option>
										  </select>
		                                  </div>
		                                  </div> 	 
			                              <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_sede">Sede</label>
		                                  <div class="col-lg-8">
												<select class="form-control" id="id_act_sede" name="sede" disabled="disabled">
												<option value=" ">[Seleccione]</option>
												</select>
		                                  </div>
		                                  </div> 	 
		                                  <div class="form-group"  >
		                                  <div class="col-lg-12" align="center">
		                                        <button type="button" style="width: 80px" id="id_btn_salir" class="btn btn-primary btn-sm" data-dismiss="modal">Salir</button>
		                                  </div>
		                                  </div>
			                             </div>
			                         </form>
			                    </div>
			              </div>
			         </div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
		$.getJSON("cargarSedes", {}, function (data){
			$.each(data, function(index, item){
				$("#id_sede").append("<option value=" +  item.idSede +" >" +  item.nombre+ "</option>");
				$("#id_act_sede").append("<option value=" +  item.idSede +" >" +  item.nombre+ "</option>");
			});	
		});	
	
					$("#id_btn_filtro").click(function() {
						var vnumero = $("#id_numero").val();
						var vsede = $("#id_sede").val();
						var vestado = $("#id_estado").is(":checked") ?  1 : 0;
						var vrecursos = $("#id_recursos").val();
			
			       console.log(">> vnumero >> " + vnumero);
			       console.log(">> vsede >> " + vsede);
			       console.log(">> vestado >> " + vestado);
			       console.log(">> vrecursos >> " + vrecursos);
			
			$.getJSON("listaSalaComplejoServlet", {"numero":vnumero,"sede":vsede, "estado": vestado, "recursos":vrecursos}, function(data)
			{
				agregarGrilla(data);
			});
		});
		
		
		function agregarGrilla(lista){
			 $('#id_table').DataTable().clear();
			 $('#id_table').DataTable().destroy();
			 $('#id_table').DataTable({
					data: lista,
					language: IDIOMA,
					searching: true,
					ordering: true,
					processing: true,
					pageLength: 10,
					lengthChange: false,
					info:true,
					scrollY: 305,
			        scroller: {
			            loadingIndicator: true
			        },
		 columns:[
			{data: "idSala",className:'text-center'},
			{data: "numero",className:'text-center'},
			 {data: "piso",className:'text-center'},
			{data: "numAlumnos",className:'text-center'},
			{data: "recursos",className:'text-center'},
			{data: function(row, type, val, meta){
					return row.estado == 1 ? "Activo" : "Inactivo";  
				},className:'text-center'},
				{data: "sede.nombre",className:'text-center'},
				{data: function(row, type, val, meta){
					return '<button type="button" onClick="verFormulario(\'' + row.numero + '\',\'' + row.piso + '\',\'' + row.numAlumnos + '\',\'' +  row.recursos + '\',\'' +  row.estado + '\',\'' +  row.sede.idSede +'\');"  class="btn btn-info btn-sm">Ver</button>';  
				},className:'text-center'},
			]                                     
			    });
		   }
		
		function verFormulario(numero, piso, numAlumnos, recursos, estado, sede){
			console.log(" >>>   verFormulario ");
			$("#id_div_modal_ver").modal("show");
			$("#id_act_numero").val(numero);
			$("#id_act_piso").val(piso);
			$("#id_act_numalum").val(numAlumnos);
			$("#id_act_recursos").val(recursos);
			$("#id_act_estado").val(estado);
			$("#id_act_sede").val(sede);
		}
	</script>

</body>
</html>






