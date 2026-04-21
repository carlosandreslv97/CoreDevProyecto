using DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoGrupo6.Pages
{
    public partial class CrearHotel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cuvNombre_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                //validacion que permite saber si existe una habitacion por medio de un procedimiento
                string nombre = txtNombre.Text;

                using (var db = new PvProyectoFinalDB("Database"))
                {
                    var resultado = db.SpValidarHotel(nombre).FirstOrDefault();

                    if (resultado != null && resultado.Existe > 0)
                    {
                        args.IsValid = false;
                    }
                    else
                    {
                        args.IsValid = true;
                    }
                }
            }
            catch { }

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //boton que permite guardar la habitacion despues validar los campos
                try
                {
                    //asignar variables a los campos
                    string nombreHotel = txtNombre.Text;
                    string direccion = txtDireccion.Text;
                    int costoAdulto = Convert.ToInt32(txtNumAdultos.Text);
                    int costoNino = Convert.ToInt32(txtNumNinos.Text);


                    using (PvProyectoFinalDB db = new PvProyectoFinalDB("Database"))
                    {
                        db.SpInsertarHotel(nombreHotel,direccion,costoAdulto,costoNino);

                    }

                }
                catch
                {
                }

                Session["Mensaje"] = "CreadoHotel";
                Response.Redirect("~/Pages/Mensajes.aspx");
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {

            //boton regresar, si es empleado regresa al gestionarReservaciones
            //si es cliente debe regresar a MisReservaciones
            try
            {
                bool esEmpleado = Convert.ToBoolean(Session["esEmpleado"]);

                if (esEmpleado == true)
                {
                    Response.Redirect("GestionarReservaciones.aspx");
                }
                else
                {
                    Response.Redirect("MisReservaciones.aspx");
                }

            }
            catch { }
        }
    }
}