<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarHoteles.aspx.cs" Inherits="ProyectoGrupo6.Pages.ListarHoteles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="titulo">
        <div class="izquierda">
            <h1>Lista hoteles</h1>
        </div>
        <div class="derecha">
            <asp:Label ID="lblUsuario" runat="server" Text="Usuario" Font-Bold="True"></asp:Label>
        </div>
    </div>
    <!--------------------------------------------------------------------------------------->
    <div>
        <a href="CrearHotel.aspx" class="btn btn_cr" role="button">Crear hoteles</a>
    </div>

    <!--------------------------------------------------------------------------------------->
    <div>
        <asp:GridView ID="grdListaHoteles" runat="server" AutoGenerateColumns="false" CssClass="rgrid table table-bordered table-hover"
            HeaderStyle-CssClass="rgrid-header" RowStyle-BackColor="WhiteSmoke" AlternatingRowStyle-BackColor="White">
            <Columns>
                <asp:BoundField DataField="IdHotel" HeaderText="ID"
                    HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center"></asp:BoundField>

                <asp:BoundField DataField="Nombre" HeaderText="Nombre"
                    HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"></asp:BoundField>

                <asp:BoundField DataField="Direccion" HeaderText="Dirección"
                    HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center"></asp:BoundField>

                <asp:BoundField DataField="CostoPorCadaAdulto" HeaderText="Costo por adulto"
                    HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" DataFormatString="${0:N2}"></asp:BoundField>

                <asp:BoundField DataField="CostoPorCadaNinho" HeaderText="Costo por niño"
                    HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" DataFormatString="${0:N2}"></asp:BoundField>

                <asp:TemplateField HeaderText="" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <a href='EditarHotel.aspx?idHotel=<%# Eval("idHotel") %>'>Modificar</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
