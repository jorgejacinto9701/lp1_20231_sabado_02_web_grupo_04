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
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>

<title>Crud Autor</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
	<h4>CRUD Autor</h4>
	
	<div class="row" style="margin-top: 5%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Nombres</label> 
			</div>	
			<div class="col-md-6">
				<input	class="form-control" type="text" id="id_filtro" placeholder="Ingresar nombre">
			</div>	
			<div class="col-md-1">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtro</button>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-primary" data-toggle='modal' data-target="#id_div_modal_registra">Registra</button>
			</div>	
		</div>
		
		
		<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#337ab7; color:white'>
					<tr>
						<th>Código</th>
						<th>Nombre</th>
						<th>Apellido</th>
						<th>Fecha Nacimiento</th>
						<th>Teléfono</th>
						<th>Estado</th>
						<th>Grado</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>

		</div>
		
		
		<!-- BOTON REGISTRO -->
		<div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Autor</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_registra">
			                   			<input type="hidden" name="metodo" value="inserta">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingresar nombre" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_apellido">Apellido</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_apellido" name="apellido" placeholder="Ingresar apellido" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fecNac">Fecha Nacimiento</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_fecNac" name="fechaNacimiento" type="date" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_telefono">Teléfono</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_telefono" name="telefono" placeholder="Ingresar numero celular" type="tel" maxlength="9"/>
		                                        </div>
		                                    </div>
		                                     	
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_grado">Grado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_reg_grado" name="grado">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_registra" class="btn btn-primary btn-sm">Registra</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_reg_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancela</button>
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
		
		
		
		<!-- BOTON EDITAR -->
		<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualizar Autor</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idAutor" id="idAutor" >
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_nombre">Nombre</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingresar nombre" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_apellido">Apellido</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_apellido" name="apellido" placeholder="Ingresar apellido" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fecNac">Fecha Nacimiento</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_fecNac" name="fechaNacimiento" type="date" />
		                                        </div>
		                                    </div> 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_telefono">Teléfono</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_telefono" name="telefono" placeholder="Ingresar numero celular" type="tel" maxlength="9"/>
		                                        </div>
		                                    </div>	 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_estado" name="estado">
														<option value=" ">[Seleccione]</option>
														<option value="1">Activo</option>
														<option value="0">Inactivo</option>
													</select>
		                                        </div>
		                                    </div> 	 
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_grado">Grado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_grado" name="grado">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	  
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_actualiza" class="btn btn-primary btn-sm">Actualizar</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_act_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancelar</button>
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
		$("#id_btn_filtro").click(function() {
			var vfiltro = $("#id_filtro").val();
			$.getJSON("crudAutor", {"metodo": "lista","filtro":vfiltro}, function(data) {
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
					pageLength: 9,
					lengthChange: false,
					info:true,
					scrollY: 410,
			        scroller: {
			            loadingIndicator: true
			        },
					columns:[  
						{data: "idAutor",className:'text-center'},
						{data: "nombres",className:'text-center'},
						{data: "apellidos",className:'text-center'},
						{data: "formateadoFecNac",className:'text-center'},
						{data: "telefono",className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "grado.descripcion",className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-info btn-sm" onClick="verFormularioActualiza(\'' + row.idAutor + '\',\'' +  row.nombres   + '\',\'' +  row.apellidos   + '\',\'' +  row.formateadoFecNac + '\',\'' +  row.telefono   + '\',\'' +  row.estado + '\',\'' +  row.grado.idGrado +'\');">Editar</button>';  
						},className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-warning btn-sm" onClick="eliminacionLogica(\'' + row.idAutor +'\');" >Activo</button>';
						},className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-danger btn-sm"  onClick="eliminacionFisica(\'' + row.idAutor +'\');" >Eliminar</button>';
						},className:'text-center'},
					]                                     
			    });
		}
		
		function eliminacionLogica(idAutor){
			 $.ajax({
		          type: "POST",
		          url: "crudAutor", 
		          data: {"metodo":"eLogica", "idAutor":idAutor},
		          success: function(data){
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		}
		
		function eliminacionFisica(idAutor){	
			var array = [idAutor];
			mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica,null,array);
		}
		
		function accionEliminacionFisica(array){
			 $.ajax({
		          type: "POST",
		          url: "crudAutor", 
		          data: {"metodo": "eFisica", "idAutor":array[0]},
		          success: function(data){
 		        	  mostrarMensaje(data.mensaje);
 		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		        });
		}
		
		function verFormularioActualiza(idAutor, nombre, apellido, fecNac, estado, grado){
			console.log(">>> verFormularioActualiza");
			$("#id_div_modal_actualiza").modal("show");
			$("#idAutor").val(idAutor);
			$("#id_act_nombre").val(nombre);
			$("#id_act_apellido").val(apellido);
			$("#id_act_fecNac").val(fecNac);
			$("#id_act_telefono").val(telefono);
			$("#id_act_estado").val(estado);
			$("#id_act_grado").val(grado);
		}
		
		$.getJSON("cargaGrado", {}, function (data){
			$.each(data, function(index, item){
				$("#id_reg_grado").append("<option value=" +  item.idGrado +" >" +  item.descripcion+ "</option>");
				$("#id_act_grado").append("<option value=" +  item.idGrado +" >" +  item.descripcion+ "</option>");
			});	
		});	

		$("#id_btn_registra").click(function(){
			var validator = $('#id_form_registra').data('bootstrapValidator');
		    validator.validate();
			
		    if (validator.isValid()) {
		        $.ajax({
			          type: "POST",
			          url: "crudAutor", 
			          data: $('#id_form_registra').serialize(),
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
	 		        	  agregarGrilla(data.datos);
	 		        	  validator.resetForm();
			        	  $('#id_div_modal_registra').modal("hide");
			        	  limpiarFormulario();
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
		        });
		    } 
		});	
		
		$("#id_btn_actualiza").click(function() {
			var validator = $('#id_form_actualiza').data('bootstrapValidator');
		    validator.validate();
			
		    if (validator.isValid()) {
		        $.ajax({
			          type: "POST",
			          url: "crudAutor", 
			          data: $('#id_form_actualiza').serialize(),
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
			        	  agregarGrilla(data.datos);
			        	  validator.resetForm();
			        	  $('#id_div_modal_actualiza').modal("hide");
			        	  limpiarFormulario();
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
			    });
		    }
		});
		
		$(document).ready(function() {
		    $('#id_form_registra').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields:{
		        	nombre : {  
		        		selector: "#id_reg_nombre",
		        		validators : {
		        			notEmpty: {
		                        message: 'El nombre es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 25,
		                        message: 'El nombre debe tener de 3 a 25 caracteres'
		                    },
		        		}
		        	},
		        	apellido : {  
		        		selector: "#id_reg_apellido",
		        		validators : {
		        			notEmpty: {
		                        message: 'El apellido es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 25,
		                        message: 'El apellido debe tener de 3 a 25 caracteres'
		                    },
		        		}
		        	},
		        	fechaNacimiento : {
		        		selector: "#id_reg_fecNac",
		        		validators : {
		        			notEmpty: {
		                        message: 'La fecha de nacimiento es requerida'
		                    },
		        		}
		        	},
		        	telefono : {  
		        		selector: "#id_reg_telefono",
		        		validators : {
		        			notEmpty: {
		                        message: 'El teléfono es requerido'
		                    },
		                    
		                    
		                    regexp: {
		                        regexp: /^\d{9}$/,
		                        message: 'El teléfono solo puede contener números y tener 9 dígitos'
		                    },
		                    
		                    
		                    
		        		}
		        	},
		        	grado : {
		        		selector: "#id_reg_grado",
		        		validators : {
		        			notEmpty: {
		                        message: 'El grado es requerido'
		                    },
		        		}
		        	},        	
		        }
		    });
		});
		
		$(document).ready(function() {
		    $('#id_form_actualiza').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields:{
		        	nombre : {  
		        		selector: "#id_act_nombre",
		        		validators : {
		        			notEmpty: {
		                        message: 'El nombre es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 25,
		                        message: 'El nombre debe tener de 3 a 25 caracteres'
		                    },
		        		}
		        	},
		        	apellido : {  
		        		selector: "#id_act_apellido",
		        		validators : {
		        			notEmpty: {
		                        message: 'El apellido es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 25,
		                        message: 'El apellido debe tener de 3 a 25 caracteres'
		                    },
		        		}
		        	},
		        	fechaNacimiento : {
		        		selector: "#id_act_fecNac",
		        		validators : {
		        			notEmpty: {
		                        message: 'La fecha de nacimiento es requerida'
		                    },
		        		}
		        	},
		        	telefono : {  
		        		selector: "#id_act_telefono",
		        		validators : {
		        			notEmpty: {
		                        message: 'El teléfono es requerido'
		                    },
		                    
		                    
		                    regexp: {
		                        regexp: /^\d{9}$/,
		                        message: 'El teléfono solo puede contener números y tener 9 dígitos'
		                    },
		                    
		                    
		                    
		        		}
		        	},
		        	estado : {
		        		selector: "#id_act_estado",
		        		validators : {
		        			notEmpty: {
		                        message: 'El estado es requerido'
		                    },
		        		}
		        	},     
		        	grado : {
		        		selector: "#id_act_grado",
		        		validators : {
		        			notEmpty: {
		                        message: 'El grado es requerido'
		                    },
		        		}
		        	},       	
		        }
		    });
		});		
		
		function limpiarFormulario(){	
			$('#id_reg_nombre').val("");
			$('#id_reg_apellido').val("");
			$('#id_reg_fecNac').val("");
			$('#id_reg_telefono').val("");
			$('#id_reg_grado').val(" ");
			$('#id_act_nombre').val("");
			$('#id_act_apellido').val("");
			$('#id_act_fecNac').val("");
			$('#id_act_telefono').val("");
			$('#id_act_grado').val(" ");
			$('#id_act_estado').val(" ");
		}
		
	</script>

</body>
</html>



