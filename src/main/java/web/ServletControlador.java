package web;

import datos.ClienteDaoJDBC;
import dominio.Cliente;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    String accion = req.getParameter("accion");
    if (accion != null) {
      switch (accion) {
        case "editar":
          showEditCliente(req, res);
          break;
        case "eliminar":
          deleteCliente(req, res);
          break;
        default:
          this.accionDefult(req, res);
      }
    } else {
      this.accionDefult(req, res);
    }
  }

  private void accionDefult(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    List<Cliente> clientes = new ClienteDaoJDBC().listar();
    System.out.println("clientes = " + clientes);
    HttpSession session = req.getSession();
    session.setAttribute("clientes", clientes);
    session.setAttribute("totalClientes", clientes.size());
    session.setAttribute("saldoTotal", calcularSaldoTotal(clientes));
    res.sendRedirect("clientes.jsp");
    //req.getRequestDispatcher("clientes.jsp").forward(req, res);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    String accion = req.getParameter("accion");
    if (accion != null) {
      switch (accion) {
        case "insertar":
          addCliente(req, res);
          break;
        case "modificar":
          editCliente(req, res);
          break;
        default:
          this.accionDefult(req, res);
      }
    } else {
      this.accionDefult(req, res);
    }
  }

  private void addCliente(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    // 1. Recuperar los valores del formulario agregar cliente
    String nombre = req.getParameter("txtNombre");
    String apellido = req.getParameter("txtApellido");
    String email = req.getParameter("txtEmail");
    String telefono = req.getParameter("txtTelefono");
    double saldo = 0;
    String saldoString = req.getParameter("txtSaldo");
    if (saldoString != null && !"".equals(saldoString)) {
      saldo = Double.parseDouble(saldoString);
    }

    // 2. Creacion del objeto o bean para almacenar los datos
    Cliente cliente = new Cliente(nombre, apellido, email, telefono, saldo);

    // 3. insercion de los datos en la BBDD
    int registrosModificados = new ClienteDaoJDBC().insertar(cliente);
    System.out.println("registrosModificados = " + registrosModificados);

    // 4. Redirigir a la accion por default
    this.accionDefult(req, res);
  }

  private void showEditCliente(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    String id = req.getParameter("id");
    if (id != null && !"".equals(id)) {
      int idCliente = Integer.parseInt(id);
      Cliente cliente = new ClienteDaoJDBC().encontrar(new Cliente(idCliente));
      if (cliente != null) {
        req.setAttribute("cliente", cliente);
        String jspEditar = "/WEB-INF/pages/private/editarCliente.jsp";
        req.getRequestDispatcher(jspEditar).forward(req, res);
      }
    }
  }

  private void editCliente(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    String id = req.getParameter("idCliente");
    if (id != null && !"".equals(id)) {
      int idCliente = Integer.parseInt(id);
      String nombre = req.getParameter("txtNombre");
      String apellido = req.getParameter("txtApellido");
      String email = req.getParameter("txtEmail");
      String telefono = req.getParameter("txtTelefono");
      double saldo = 0;
      String saldoString = req.getParameter("txtSaldo");
      if (saldoString != null && !"".equals(saldoString)) {
        saldo = Double.parseDouble(saldoString);
      }
      Cliente cliente = new Cliente(idCliente, nombre, apellido, email, telefono, saldo);
      int registrosModificados = new ClienteDaoJDBC().actualizar(cliente);
      System.out.println("registrosModificados = " + registrosModificados);
      this.accionDefult(req, res);
    }
  }

  private void deleteCliente(HttpServletRequest req, HttpServletResponse res)
          throws ServletException, IOException {
    String id = req.getParameter("idCliente");
    if (id != null && !"".equals(id)) {
      int idCliente = Integer.parseInt(id);
      Cliente cliente = new Cliente(idCliente);
      int registrosModificados = new ClienteDaoJDBC().eliminar(cliente);
      System.out.println("registrosModificados = " + registrosModificados);
      this.accionDefult(req, res);
    }
  }

  private double calcularSaldoTotal(List<Cliente> clientes) {
    double saldoTotal = 0;
    for (Cliente aux : clientes) {
      saldoTotal += aux.getSaldo();
    }
    return saldoTotal;
  }
}
