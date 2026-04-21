<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarUsuario.aspx.cs" Inherits="ProyectoGrupo6.Pages.EditarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="contenedor_mod">
        <h1>Editar Usuario</h1>
        <br />
        <asp:Label ID="lblMensaje" runat="server" Visible="false"></asp:Label>
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
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn_log" OnClick="btnModificar_Click" />
        </div>

    </div>


    <asp:UpdatePanel ID="updUsuarios" runat="server">
        <ContentTemplate>

            <div id="ListDatos" runat="server">
                <h2>Lista de Usuarios</h2>
                <br />
                <div style="width: 80%; margin: auto; margin-bottom: 10px;">
                    <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" Placeholder="Buscar por nombre..." AutoPostBack="true" OnTextChanged="txtBuscar_TextChanged" />
                </div>
                <br />
                <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-sm" OnRowCommand="gvUsuarios_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="IdPersona" HeaderText="ID"
                            HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="NombreCompleto" HeaderText="Nombre Completo"
                            HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" />
                        <asp:TemplateField HeaderText="EsEmpleado" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <%# Convert.ToInt32(Eval("esEmpleado")) == 1 ? "Empleado" : "Cliente" %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <%#  Eval("Estado").ToString()  == "A" ? "Activo" : "Inactivo" %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:Button ID="btnEstado" runat="server"
                                    Text='<%# Eval("Estado").ToString() == "A" ? "Inactivar" : "Activar" %>'
                                    CommandName="CambiarEstado"
                                    CommandArgument='<%# Eval("IdPersona") %>'
                                    CssClass="btn btn-warning btn-sm"
                                    CausesValidation="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
