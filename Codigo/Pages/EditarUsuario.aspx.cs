using DataModels;
using ProyectoGrupo6.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoGrupo6.Pages
{
    public partial class EditarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario usuario = (Usuario)Session["Usuario"];
                bool esEmpleado = Convert.ToBoolean(Session["esEmpleado"]);

                txtNombre.Text = usuario.nombreCompleto;
                txtEmail.Text = usuario.email;

                CargarUsuarios();

            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                try
                {

                    Usuario usuario = (Usuario)Session["Usuario"];

                    var idPersona = usuario.idPersona;
                    string nombreCompleto = txtNombre.Text;
                    string email = txtEmail.Text;
                    string clave = txtClave.Text;

                    // Validar que las contraseñas coincidan
                    if (txtClave.Text != txtConfirmar.Text)
                    {
                        lblMensaje.Text = "Las contraseñas no coinciden";
                        lblMensaje.CssClass = "mensajeError";
                        lblMensaje.Visible = true;
                        return;
                    }

                    using (PvProyectoFinalDB db = new PvProyectoFinalDB("Database"))
                    {
                        db.SpModificarPersona(idPersona, nombreCompleto, email, clave);
                    }

                    lblMensaje.Text = "Usuario modificado correctamente";
                    lblMensaje.CssClass = "mensajeExito";
                    lblMensaje.Visible = true;
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = ex.Message;
                    lblMensaje.CssClass = "mensajeError";
                    lblMensaje.Visible = true;
                }
            }

        }

        protected void gvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CambiarEstado")
            {
                int idPersona = Convert.ToInt32(e.CommandArgument);

                bool esEmpleado = Convert.ToBoolean(Session["esEmpleado"]);

                using (PvProyectoFinalDB db = new PvProyectoFinalDB("Database"))
                {
                    db.SpAccionEstadoUsuario(idPersona, esEmpleado);
                }

                // Recargar la tabla
                CargarUsuarios();
            }
        }

        private void CargarUsuarios()
        {
            try
            {

                bool esEmpleado = Convert.ToBoolean(Session["esEmpleado"]);
                Usuario usuario = (Usuario)Session["Usuario"];

                using (PvProyectoFinalDB db = new PvProyectoFinalDB("Database"))
                {
                    if (esEmpleado)
                    {
                        var usuarios = db.SpListarUsuarios(esEmpleado, usuario.idPersona).ToList();

                        // FILTRO POR NOMBRE
                        if (!string.IsNullOrEmpty(txtBuscar.Text))
                        {
                            string filtro = txtBuscar.Text.ToLower();
                            usuarios = usuarios
                                .Where(u => u.NombreCompleto.ToLower().Contains(filtro))
                                .ToList();
                        }

                        gvUsuarios.DataSource = usuarios;
                        gvUsuarios.DataBind();

                        ListDatos.Visible = true;
                    }
                    else
                    {
                        ListDatos.Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {

                lblMensaje.Text = ex.Message;
                lblMensaje.CssClass = "mensajeError";
                lblMensaje.Visible = true;
            }
        }
        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            CargarUsuarios();

        }
    }
}