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
<h4>Registra Sala</h4>

	<form id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Numero</label>
				<input class="form-control" type="number" id="id_numero" name="numero" placeholder="Ingrese el numero">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_piso">Piso</label>
				<input class="form-control" type="number" id="id_piso" name="piso" placeholder="Ingrese el piso" value="1">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_num_alumnos"># Alumnos</label>
				<input class="form-control" type="number" id="id_num_alumnos" name="numAlumnos" value="1">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_recursos">Recursos</label>
				<input class="form-control" type="text" id="id_recursos" name="recursos" placeholder="Ingrese los recursos">
			</div>
			
			
			<div class="form-group">
				<label class="control-label" for="id_sede"> Sede </label> <select
					class="form-control" id="id_sede" name="sede">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_registra">Crea Sala</button>
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
        	numero : {  
        		selector: "#id_numero",
        		validators : {
        			notEmpty: {
                        message: 'El numero es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 20,
                        message: 'El numero tiene de 3 a 20 caracteres'
                    },
        		}
        	},
        	piso : {
        		selector: "#id_piso",
        		validators : {
        			notEmpty: {
                        message: 'El número de piso es requerido'
                    },
        		}
        	},
        	numAlumnos : {
        		selector: "#id_num_alumnos",
        		validators : {
        			notEmpty: {
                        message: 'Los recursos son requeridos'
                    },
        		}
        	},
        	recursos : {
        		selector: "#id_recursos",
        		validators : {
        			notEmpty: {
                        message: 'Los recursos son requeridos'
                    },
        		}
        	},
        	sede : {
        		selector: "#id_sede",
        		validators : {
        			notEmpty: {
                        message: 'La sede es requerida'
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
	          url: "registraSala", 
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
	
	$.getJSON("cargaSede", {}, function (data){
		$.each(data, function(index, item){
			$("#id_sede").append("<option value=" +  item.idSede +" >" +  item.nombre + "</option>");
		});	
	});	
	
	function limpiarFormulario(){	
		$('#id_numero').val('');
		$('#id_piso').val('1');
		$('#id_num_alumnos').val('1');
		$('#id_recursos').val('');
		$('#id_sede').val(' ');
	}
</script>
		
</body>
</html>



