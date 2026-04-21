using DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoGrupo6.Pages
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Validar que las contraseñas coincidan
                if (txtClave.Text != txtConfirmar.Text)
                {
                    lblMensaje.Text = "Las contraseñas no coinciden";
                    lblMensaje.CssClass = "mensajeError";
                    lblMensaje.Visible = true;
                    return;
                }

                try
                {
                    string nombreCompleto = txtNombre.Text;
                    string email = txtEmail.Text;
                    string clave = txtClave.Text;

                    //Conexion a la base 
                    using (PvProyectoFinalDB db = new PvProyectoFinalDB("Database"))
                    {
                        db.SpCrearPersona(nombreCompleto, email, clave);
                    }
                    lblMensaje.Text = "Usuario registrado correctamente";
                    lblMensaje.CssClass = "mensajeExito";
                    lblMensaje.Visible = true;
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = ex.Message;
                }

            }
        }
    }
}