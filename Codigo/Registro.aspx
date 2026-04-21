<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="ProyectoGrupo6.Pages.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro de Usuario</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="~/Content/Site.css" rel="stylesheet" runat="server" />

    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" />

</head>
<body class="registro">
    <form id="form1" runat="server">

        <div class="contenedor_registro">
            <div class="izquierda">
                <h1 class="">Registro</h1>
            </div>

            <br />
            <div class="campo">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre Completo" CssClass="labelLog"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                <!--Validaciones-->
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ForeColor="#d11212"
                    Display="Dynamic" ErrorMessage="Este campo es requerido"></asp:RequiredFieldValidator>
            </div>

            <div class="campo">
                <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="labelLog"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                <!--Validaciones-->
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Este campo es requerido" ForeColor="#d11212" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="El formato del email no es valido"
                    ValidationExpression="[^@\s]+@[^@\s]+\.[^@\s]+$" ControlToValidate="txtEmail" ForeColor="#d11212" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <div class="campo">
                <asp:Label ID="lblClave" runat="server" Text="Contraseña" CssClass="labelLog"></asp:Label>
                <div style="position: relative;">
                    <asp:TextBox ID="txtClave" runat="server" CssClass="form-control" TextMode="Password" Width="100%"></asp:TextBox>
                    <a id="btnClave" onclick="cambioClave()" role="button" class="btn btnPswd"><i id="iconClave" class="bi bi-eye-fill"></i></a>
                </div>
                <!--Validaciones-->
                <asp:RequiredFieldValidator ID="rfvClave" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtClave" ForeColor="#d11212" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="campo">
                <asp:Label ID="lblConfirmar" runat="server" Text="Confirmar contraseña" CssClass="labelLog"></asp:Label>
                <div style="position: relative;">
                    <asp:TextBox ID="txtConfirmar" runat="server" CssClass="form-control" TextMode="Password" Width="100%"></asp:TextBox>
                    <a id="btnClaveConfirmar" onclick="cambioClave()" role="button" class="btn btnPswd"><i id="iconConfirmar" class="bi bi-eye-fill"></i></a>
                </div>
                <!--Validaciones-->
                <asp:RequiredFieldValidator ID="rfvConfirmar" runat="server" ErrorMessage="Este campo es requerido" ControlToValidate="txtConfirmar" ForeColor="#d11212" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="botones">
                <asp:Button ID="btnRegistrar" runat="server" Text="Registrarse" CssClass="btn_log" OnClick="btnRegistrar_Click" />
                <br />
                <a href="Login.aspx" class="btn btn-link">¿Ya tienes una cuenta? Inicia sesión</a>
            </div>

            <asp:Label ID="lblMensaje" runat="server" Visible="false"></asp:Label>
        </div>

    </form>
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/Scripts/bootstrap.js") %>
    </asp:PlaceHolder>
</body>
</html>

<script>
    //funcion que permite cambiar el estado del campo, de password a text
    function cambioClave() {
        var txtClave = document.getElementById("<%= txtClave.ClientID %>");
        var txtConfirmar = document.getElementById("<%= txtConfirmar.ClientID %>");

        var icon1 = document.getElementById("iconClave");
        var icon2 = document.getElementById("iconConfirmar");

        if (txtClave.type === "password") {
            txtClave.type = "text";

            icon1.className = "bi bi-eye-slash-fill"; //icono cuando se muestra
        } else {
            txtClave.type = "password";
            icon1.className = "bi bi-eye-fill"; //icono cuando se oculta
        }

        if (txtConfirmar.type === "password") {
            txtConfirmar.type = "text";

            icon2.className = "bi bi-eye-slash-fill"; //icono cuando se muestra
        } else {
            txtConfirmar.type = "password";
            icon2.className = "bi bi-eye-fill"; //icono cuando se oculta
        }

    }
</script>
