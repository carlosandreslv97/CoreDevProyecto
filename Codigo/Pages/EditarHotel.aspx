<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarHotel.aspx.cs" Inherits="ProyectoGrupo6.Pages.EditarHotel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div>
      <h1>Crear Hotel</h1>
  </div>
  <div class="col-md-6">
      <!--------------------------------------------------------------------------------------->
      <asp:HiddenField ID="hdnHotel" runat="server" />
      <!--------------------------------------------------------------------------------------->
      <div>
          <asp:Label ID="lblNombre" runat="server" Text="Nombre del Hotel"></asp:Label>

          <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"  Enabled="false"></asp:TextBox>

      </div>
      <!--------------------------------------------------------------------------------------->
      <div>
          <asp:Label ID="lblDireccion" runat="server" Text="Dirección"></asp:Label>

          <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
          <!--Validaciones-->
          <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion"
              ForeColor="Red" Display="Dynamic" ErrorMessage="Falta ingresar la direccion"></asp:RequiredFieldValidator>
      </div>
      <!--------------------------------------------------------------------------------------->
      <div class="row">
          <div class="col-3">

              <label>Costo por adultos:</label>
              <asp:TextBox ID="txtNumAdultos" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
              <!--Validaciones-->
              <asp:RequiredFieldValidator ID="rfvNumeroAdultos" runat="server" ControlToValidate="txtNumAdultos"
                  ErrorMessage="Este valor es requerido" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
          </div>
          <div class="col-3">
              <label>Costo por niños:</label>
              <asp:TextBox ID="txtNumNinos" runat="server" CssClass="form-control" Text="0" TextMode="Number"></asp:TextBox>
              <!--Validaciones-->
              <asp:RequiredFieldValidator ID="rfvNumNinhos" runat="server" InitialValue="" ControlToValidate="txtNumNinos"
                  ErrorMessage="Este valor es requerido" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
          </div>
      </div>
  </div>
  <!--------------------------------------------------------------------------------------->
  <br />
  <div>
      <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
      <asp:Button ID="btnRegresar" runat="server" Text="Regresar" CssClass="btn btn-danger" CausesValidation="false" OnClick="btnRegresar_Click" />
  </div>
</asp:Content>
