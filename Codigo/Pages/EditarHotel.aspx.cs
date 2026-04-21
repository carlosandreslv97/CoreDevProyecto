using DataModels;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ProyectoGrupo6.Pages
{
    public partial class EditarHotel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                try
                {
                    bool esEmpleado = Convert.ToBoolean(Session["esEmpleado"]);
                    RedirigirSegunUsuario(esEmpleado);


                    int idHotel = int.Parse(Request.QueryString["idHotel"]);

                    using (PvProyectoFinalDB db = new PvProyectoFinalDB("Database"))
                    {
                        var Hotel = db.SpObtenerHotelPorId(idHotel).FirstOrDefault();

                        //hotel es valido y existe, muestra los datos
                        if (Hotel != null)
                        {
                            hdnHotel.Value = Hotel.IdHotel.ToString();

                            // Mostrar valores visibles
                            txtNombre.Text = Hotel.Nombre;
                            txtDireccion.Text = Hotel.Direccion;

                            txtNumAdultos.Text = Convert.ToDecimal(Hotel.CostoPorCadaAdulto)
                                .ToString(CultureInfo.InvariantCulture);

                            txtNumNinos.Text = Convert.ToDecimal(Hotel.CostoPorCadaNinho)
                                .ToString(CultureInfo.InvariantCulture);
                        }

                    }
                }

                catch
                {

                }
            }
        }



        private void RedirigirSegunUsuario(bool esEmpleado)
        {
            //redirecciona segun el tipo de usuario
            if (!esEmpleado)
                Response.Redirect("MisReservaciones.aspx");

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //guarda la edicion hecha al hotel en la base de datos
            try
            {
                int idHotel = Convert.ToInt32(hdnHotel.Value);
                string nombreHotel = txtNombre.Text;
                string direccion = txtDireccion.Text;
                decimal costoAdulto = Convert.ToDecimal(txtNumAdultos.Text, CultureInfo.InvariantCulture);
                decimal costoNino = Convert.ToDecimal(txtNumNinos.Text, CultureInfo.InvariantCulture);

                using (PvProyectoFinalDB db = new PvProyectoFinalDB("Database"))
                {
                    db.SpActualizarHotel(idHotel, nombreHotel, direccion, costoAdulto, costoNino);
                }

                Session["Mensaje"] = "EditarHotel";
                Response.Redirect("~/Pages/Mensajes.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/Pages/ListarHoteles.aspx");
            }
            catch { }
        }

    }
}