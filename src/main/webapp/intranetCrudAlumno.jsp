<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<link rel="stylesheet" href="css/styleAlumno.css" />

<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>

<title>CRUD Alumno</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">

		<h1 class="text-center">CRUD Alumno</h1>

		<div class="row panel-busca">
			<div class="col-md-3 text-custom">
				<label class="control-label text" for="id_filtro">Nombres :</label> 
			</div>	
			<div class="col-md-6">
				<input	class="form-control" type="text" id="id_filtro" placeholder="Ingrese el nombre">
			</div>	
			<div class="col-md-1">
				<button type="button" class="btn btn-comun" id="id_btn_filtro"><i class='bx bx-filter-alt mr-1'></i>Filtro</button>
			</div>	
			<div class="col-md-1">
				<button type="button" class="btn btn-comun" data-toggle='modal' data-target="#id_div_modal_registra"><i class='bx bx-archive-in'></i>Registra</button>
			</div>
		</div>
		
		
		<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#F7F7F7; color:#88898E'>
					<tr>
						<th>Código</th>
						<th>Nombres</th>
						<th>Apellidos</th>
						<th>Teléfono</th>
						<th>DNI</th>
						<th>Correo</th>
						<th>Fecha Nacimiento</th>
						<th>Estado</th>
						<th>País</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>
		</div>
		
		<!-- INICIO MODAL DE REGISTRO -->
		<div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Alumno</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_registra">
			                   			<input type="hidden" name="metodo" value="inserta">
			                   			<div class="panel-body">
			                                <div class="form-group m-4" >
		                                        <label class="col-lg-3 control-label" for="id_reg_nombres">Nombres</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_nombres" name="nombres" placeholder="Ingrese los Nombres" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_apellidos">Apellidos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_apellidos" name="apellidos" placeholder="Ingrese los Apellidos" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_telefono">Teléfono</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_telefono" name="telefono" placeholder="Ingrese el teléfono" type="text" maxlength="9"/>
		                                        </div>
		                                    </div> 
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_dni">DNI</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_dni" name="dni" placeholder="Ingrese el DNI" type="text" maxlength="8"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_correo">Correo</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_correo" name="correo" placeholder="Ingrese el correo" type="email" />
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fch_nac">fecha Nacimiento</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_fch_nac" name="fechaNacimiento" placeholder="Ingrese la fechaNacimiento" type="date"/>
		                                        </div>
		                                    </div> 	
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">País</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_reg_pais" name="pais">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_registra" class="btn btn-primary btn-sm">Registrar</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_reg_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancelar</button>
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
		<!-- FIN MODAL DE REGISTRO -->
		<!-- INICIO MODAL DE ACTUALIZA -->
		<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza de Alumno</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idAlumno" id="idAlumno">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Nombre</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_nombres" name="nombres" placeholder="Ingrese los Nombres" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_apellidos">Apellidos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_apellidos" name="apellidos" placeholder="Ingrese los Apellidos" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_telefono">Teléfono</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_telefono" name="telefono" placeholder="Ingrese el Teléfono" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_dni">DNI</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_dni" name="dni" placeholder="Ingrese el DNI" type="text" maxlength="8"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_correo">Correo</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_correo" name="correo" placeholder="Ingrese el correo" type="email" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_fch_nac">Fecha Nacimiento</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_fch_nac" name="fechaNacimiento" placeholder="Ingrese la Fecha de nacimiento" type="date"/>
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
		                                        <label class="col-lg-3 control-label" for="id_act_pais">País</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_pais" name="pais">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_actualiza" class="btn btn-primary btn-sm">Registrar</button>
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
		<!-- FIN MODAL DE ACTUALIZA -->
	
</div>


<script type="text/javascript">
$("#id_btn_filtro").click(function() {
	var vfiltro = $("#id_filtro").val();
	$.getJSON("crudAlumno", {"metodo":"lista","filtro":vfiltro}, function(data) {
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
				{data: "idAlumno",className:'text-center'},
				{data: "nombres",className:'text-center'},
				{data: "apellidos",className:'text-center'},
				{data: "telefono",className:'text-center'},
				{data: "dni",className:'text-center'},
				{data: "correo",className:'text-center'},
				{data: "formateadoFecNac",className:'text-center'},
				{data: function(row, type, val, meta){
					return row.estado == 1 ? "Activo" : "Inactivo";  
				},className:'text-center'},
				{data: "pais.nombre",className:'text-center'},
				{data:  function(row, type, val, meta){
					return '<button type="button" class="btn btn-edit btm-sm" onClick="verFormularioActualiza(\'' +  row.idAlumno + '\',\'' + row.nombres  + '\',\'' + row.apellidos  + '\',\'' + row.telefono  + '\',\'' + row.dni  + '\',\'' + row.correo  + '\',\'' + row.formateadoFecNac  + '\',\'' + row.estado +'\',\'' + row.pais.idPais + '\');" ><i class="bx bx-edit-alt i-size"></i></button>';
				},className:'text-center'},
				{data:  function(row, type, val, meta){
					return '<button type="button" class="btn btn-log btm-sm" onClick="eliminacionLogica(\'' + row.idAlumno +'\');"><i class="bx bx-transfer i-size"></i></button>';
				},className:'text-center'},
				{data:  function(row, type, val, meta){
					return '<button type="button" class="btn btn-fis btn-sm"  onClick="eliminacionFisica(\'' + row.idAlumno +'\');" ><i class="bx bx-x-circle i-size"></i></button>';
				},className:'text-center'},
			]                                     
	    });
}
function eliminacionLogica(idAlumno){
	 $.ajax({
       type: "POST",
       url: "crudAlumno", 
       data: {"metodo":"eLogica", "idAlumno":idAlumno},
       success: function(data){
     	  agregarGrilla(data.datos);
       },
       error: function(){
     	  mostrarMensaje(MSG_ERROR);
       }
   });
}
function eliminacionFisica(idAlumno) {
    var array = [idAlumno];
    mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica, null, array);
}

function accionEliminacionFisica(array) {
    $.ajax({
        type: "POST",
        url: "crudAlumno",
        data: { "metodo": "eFisica", "idAlumno": array[0] },
        success: function(data) {
            mostrarMensaje(data.mensaje);
            agregarGrilla(data.datos);
        },
        error: function() {
            mostrarMensaje(MSG_ERROR);
        }
    });
}

	 function verFormularioActualiza(idAlumno, nombres, apellidos, telefono, dni, correo, fechaNacimiento, estado, pais){
		    console.log(">> verFormularioActualiza >> " + idAlumno);
			$("#id_div_modal_actualiza").modal("show");
			$("#idAlumno").val(idAlumno);
			$("#id_act_nombres").val(nombres);
			$("#id_act_apellidos").val(apellidos);
			$("#id_act_telefono").val(telefono);
			$("#id_act_dni").val(dni);
			$("#id_act_correo").val(correo);
			$("#id_act_fch_nac").val(fechaNacimiento);
			$("#id_act_estado").val(estado);
			$("#id_act_pais").val(pais);
			
		}
	 
	 $.getJSON("cargaPais", {}, function (data){
			$.each(data, function(index, item){
				$("#id_reg_pais").append("<option value=" +  item.idPais +" >" +  item.nombre+ "</option>");
				$("#id_act_pais").append("<option value=" +  item.idPais +" >" +  item.nombre+ "</option>");
			});	
		});	
	 
		
	 $("#id_btn_registra").click(function(){
			var validator = $('#id_form_registra').data('bootstrapValidator');
		    validator.validate();
			
		    if (validator.isValid()) {
		        $.ajax({
			          type: "POST",
			          url: "crudAlumno", 
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
			          url: "crudAlumno", 
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
		        	nombres : {  
		        		selector: "#id_reg_nombres",
		        		validators : {
		        			notEmpty: {
		                        message: 'El nombre es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 30,
		                        message: 'El nombre tiene de 3 a 30 caracteres'
		                    },
		        		}
		        	},
		        	apellidos : {  
		        		selector: "#id_reg_apellidos",
		        		validators : {
		        			notEmpty: {
		                        message: 'El apellido son requerido'
		                    },
		                    stringLength: {
		                        min: 5,
		                        max: 50,
		                        message: 'El apellido tiene de 5  a 50 caracteres'
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
		                        regexp: /^[0-9]{9}$/,
		                        message: 'El teléfono tiene 9 dígitos'
		                    },
		        		}
		        	},
		        	dni : {  
		        		selector: "#id_reg_dni",
		        		validators : {
		        			notEmpty: {
		                        message: 'El DNI es requerido'
		                    },
		                    regexp: {
		                        regexp: /^[0-9]{8}$/,
		                        message: 'El DNI tiene 8 dígitos'
		                    },
		        		}
		        	},
		        	correo : {  
		        		selector: "#id_reg_correo",
		        		validators : {
		        			notEmpty: {
		                        message: 'El correo es requerido'
		                    },
		                    emailAddress: {
		                        message: 'El correo no tiene formato'
		                    }
		        		}
		        	},
		        	fechaNacimiento : {
		        		selector: "#id_reg_fch_nac",
		        		validators : {
		        			notEmpty: {
		                        message: 'La fecha de nacimiento es requerida'
		                    },
		        		}
		        	},
		        	pais : {
		        		selector: "#id_reg_pais",
		        		validators : {
		        			notEmpty: {
		                        message: 'El país es requerido'
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
		        	nombres : {  
		        		selector: "#id_act_nombres",
		        		validators : {
		        			notEmpty: {
		                        message: 'El nombre es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 30,
		                        message: 'El nombre tiene de 3 a 30 caracteres'
		                    },
		        		}
		        	},
		        	apellidos : {  
		        		selector: "#id_act_apellidos",
		        		validators : {
		        			notEmpty: {
		                        message: 'El apellido es requerido'
		                    },
		                    stringLength: {
		                        min: 5,
		                        max: 50,
		                        message: 'El apellidos tiene de 5 a 50 caracteres'
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
		                        regexp: /^[0-9]{9}$/,
		                        message: 'El teléfono tiene 9 dígitos'
		                    },
		        		}
		        	},
		        	dni : {  
		        		selector: "#id_act_dni",
		        		validators : {
		        			notEmpty: {
		                        message: 'El DNI es requerido'
		                    },
		                    regexp: {
		                        regexp: /^[0-9]{8}$/,
		                        message: 'El DNI tiene 8 dígitos'
		                    },
		        		}
		        	},
		        	correo : {  
		        		selector: "#id_act_correo",
		        		validators : {
		        			notEmpty: {
		                        message: 'El correo es requerido'
		                    },
		                    emailAddress: {
		                        message: 'El correo no tiene formato'
		                    }
		        		}
		        	},
		        	fechaNacimiento : {
		        		selector: "#id_act_fch_nac",
		        		validators : {
		        			notEmpty: {
		                        message: 'La fecha de nacimiento es requerida'
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
		        	pais : {
		        		selector: "#id_act_pais",
		        		validators : {
		        			notEmpty: {
		                        message: 'El país es requerido'
		                    },
		        		}
		        	},       	
		        }
		    });
		});		
	 
	 function limpiarFormulario(){	
			$('#id_reg_nombres').val("");
			$('#id_reg_apellidos').val("");
			$('#id_reg_telefono').val("");
			$('#id_reg_dni').val("");
			$('#id_reg_correo').val("");
			$('#id_reg_fch_nac').val("");
			$('#id_reg_pais').val(" ");
			$('#id_act_nombres').val("");
			$('#id_act_apellidos').val("");
			$('#id_act_telefono').val("");
			$('#id_act_dni').val("");
			$('#id_act_correo').val("");
			$('#id_act_fch_nac').val("");
			$('#id_act_pais').val(" ");
			$('#id_act_estado').val(" ");
		}
	

</script>
</body>
</html>




