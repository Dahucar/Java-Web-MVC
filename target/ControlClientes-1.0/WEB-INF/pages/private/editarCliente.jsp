<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" 
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" 
          crossorigin="anonymous"> 
    <!-- fontawesome ICONS -->
    <script src="https://kit.fontawesome.com/6e3e85ce1d.js" crossorigin="anonymous"></script>
    <title>JAVA WEB MVC</title>
  </head>
  <body>
    <!-- HEADER -->
    <jsp:include page="/WEB-INF/pages/public/header.jsp" /> 
    <form action="${pageContext.request.contextPath}/ServletControlador?accion=modificar&idCliente=${cliente.idCliente}"
          method="post" class="was-validated">
      <jsp:include page="/WEB-INF/pages/public/navButtos.jsp" /> 
      <section id="datails">
        <div class="container">
          <div class="row">
            <div class="col">
              <div class="card">
                <div class="card-header">
                  <h4>Editar cliente</h4>
                </div>
                <div class="card-body">
                  <div class="form-group">
                    <label for="textNombre">Nombre</label>
                    <input type="text" class="form-control" name="txtNombre" id="txtNombre" placeholder="Ingrese nombre" required
                           value="${cliente.nombre}"/>
                  </div>
                  <div class="form-group">
                    <label for="txtApellido">Apellido</label>
                    <input type="text" class="form-control" name="txtApellido" id="txtApellido" placeholder="Ingrese apellido" required
                           value="${cliente.apellido}"/>
                  </div>
                  <div class="form-group">
                    <label for="txtEmail">Email</label>
                    <input type="email" class="form-control" name="txtEmail" id="txtEmail" placeholder="Ingrese email" required
                           value="${cliente.email}"/>
                  </div>
                  <div class="form-group">
                    <label for="txtTelefono">Telefono</label>
                    <input type="text" class="form-control" name="txtTelefono" id="txtTelefono" placeholder="Ingrese telefono" required
                           value="${cliente.telefono}"/>
                  </div>
                  <div class="form-group">
                    <label for="txtSaldo">Saldo</label>
                    <input type="number" class="form-control" name="txtSaldo" id="txtSaldo" placeholder="Ingrese saldo" required
                           value="${cliente.saldo}"/>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </form> 

    <!-- FOODER -->
    <jsp:include page="/WEB-INF/pages/public/footer.jsp" />
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
  </body>
</html>
