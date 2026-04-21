using DataModels;
using ProyectoGrupo6.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static DataModels.PvProyectoFinalDBStoredProcedures;

namespace ProyectoGrupo6.Pages
{
    public partial class ListarHoteles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                bool esEmpleado = Convert.ToBoolean(Session["esEmpleado"]);
                RedirigirSegunUsuario(esEmpleado);

                Usuario usuario = (Usuario)Session["Usuario"];

                lblUsuario.Text = "Usuario: " + usuario.nombreCompleto;

                using (PvProyectoFinalDB db = new PvProyectoFinalDB("Database"))
                {

                    List<Hotel> resultados = db.SpListarHoteles().ToList();   
                    grdListaHoteles.DataSource = resultados;
                    grdListaHoteles.DataBind();
                }
            }
            catch
            {

            }
        }

        private void RedirigirSegunUsuario(bool esEmpleado)
        {
            //redirecciona segun el tipo de usuario
            if (!esEmpleado)
                Response.Redirect("MisReservaciones.aspx");
        }
    }
}