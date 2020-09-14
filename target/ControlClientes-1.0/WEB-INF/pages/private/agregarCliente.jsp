<!-- #addCliModal -->
<div class="modal fade" id="addCliModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-info text-white">
        <h5 class="modal-title">Agregar cliente</h5>
        <button class="close" data-dismiss="modal" >
          <span>&times;</span>
        </button> 
      </div>
      <form action="${pageContext.request.contextPath}/ServletControlador?accion=insertar"
            method="post" class="was-validated">
        <div class="modal-body">
          <div class="form-group">
            <label for="textNombre">Nombre</label>
            <input type="text" class="form-control" name="txtNombre" id="txtNombre" placeholder="Ingrese nombre" required/>
          </div>
          <div class="form-group">
            <label for="txtApellido">Apellido</label>
            <input type="text" class="form-control" name="txtApellido" id="txtApellido" placeholder="Ingrese apellido" required/>
          </div>
          <div class="form-group">
            <label for="txtEmail">Email</label>
            <input type="email" class="form-control" name="txtEmail" id="txtEmail" placeholder="Ingrese email" required/>
          </div>
          <div class="form-group">
            <label for="txtTelefono">Telefono</label>
            <input type="text" class="form-control" name="txtTelefono" id="txtTelefono" placeholder="Ingrese telefono" required/>
          </div>
          <div class="form-group">
            <label for="txtSaldo">Saldo</label>
            <input type="number" class="form-control" name="txtSaldo" id="txtSaldo" placeholder="Ingrese saldo" required/>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-success" type="submit">Guardar</button>
          <button class="btn btn-danger" type="reset">Limpiar</button>
        </div>
      </form>
    </div>
  </div>
</div>
