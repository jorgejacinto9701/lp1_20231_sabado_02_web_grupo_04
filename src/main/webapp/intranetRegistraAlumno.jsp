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

<title>Registra Alumno</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h1>Registra Alumno</h1>

	<form id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombres">Nombres</label>
				<input class="form-control" type="text" id="id_nombres" name="nombres" placeholder="Ingrese el nombres">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_apellido">Apellidos</label>
				<input class="form-control" type="text" id="id_apellido" name="apellido" placeholder="Ingrese el apellido">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_telefono">Teléfono</label>
				<input class="form-control" type="text" id="id_telefono" name="telefono" placeholder="Ingrese el teléfono">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_dni">DNI</label>
				<input class="form-control" type="text" id="id_dni" name="dni" placeholder="Ingrese el DNI" maxlength="8">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_correo">Correo</label>
				<input class="form-control" type="text" id="id_correo" name="correo" placeholder="Ingrese el correo">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fechaNacimiento">Fecha Nacimiento</label>
				<input class="form-control" type="date" id="id_fechaNacimiento" name="fechaNacimiento" placeholder="Ingrese la fecha de nacimiento">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_pais"> País </label> <select
					class="form-control" id="id_pais" name="pais">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_registra">Registra Alumno</button>
			</div>
	</form>
</div>
<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        fields:{
        	nombres : {  
        		selector: "#id_nombres",
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
        	apellido : {  
        		selector: "#id_apellido",
        		validators : {
        			notEmpty: {
                        message: 'El apellido es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'El apellido tiene de 5 a 50 caracteres'
                    },
        		}
        	},
        	telefono : {
        		selector: "#id_telefono",
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
        		selector: "#id_dni",
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
        		selector: "#id_correo",
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
        		selector: "#id_fechaNacimiento",
        		validators : {
        			notEmpty: {
                        message: 'La fecha de nacimiento es requerida'
                    },
        		}
        	},
        	pais : {
        		selector: "#id_pais",
        		validators : {
        			notEmpty: {
                        message: 'El país es requerido'
                    },
        		}
        	},        	
        }
  
    });

});
</script>

<script type="text/javascript">
$("#id_btn_registra").click(function(){
	var validator = $('#id_form').data('bootstrapValidator');
    validator.validate();
	
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "registraAlumno", 
          data: $('#id_form').serialize(),
          success: function(data){
        	  mostrarMensaje(data.mensaje);
        	  limpiarFormulario();
        	  validator.resetForm();
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
        });
        
    }
});
$.getJSON("cargaPais", {}, function (data){
	$.each(data, function(index, item){
		$("#id_pais").append("<option value=" +  item.idPais +" >" + item.nombre + "</option>");
	});	
});	


function limpiarFormulario(){	
	$('#id_nombres').val('');
	$('#id_apellido').val('');
	$('#id_telefono').val('');
	$('#id_dni').val('');
	$('#id_correo').val('');
	$('#id_fechaNacimiento').val(' ');
	$('#id_pais').val('');
}
</script>


</body>
</html>
