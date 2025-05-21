<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApp_TP_7.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>TP-N°7</title>
</head>
<body>
  <form id="form1" runat="server">
    <%-- LISTADO SUCURSALES --%>
    <div class="listado_sucursales">
      <h1>Listado de susursales</h1>
      <%-- LIST VIEW --%>
      <asp:ListView ID="listViewSucursales" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3" DataKeyNames="Id_Sucursal">
        <EditItemTemplate>
          <td runat="server" style="">
            <asp:Label ID="lblNameSuc" runat="server" Text='<%# Eval("NombreSucursal") %>' />
            <br />
            <asp:ImageButton ID="imgSuc" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' />
            <br />
            <asp:Label ID="lblDescriptionSuc" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
            <br />
          </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
          <table runat="server" style="">
            <tr>
              <td>No data was returned.</td>
            </tr>
          </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
          <td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
          <tr id="itemPlaceholderContainer" runat="server">
            <td id="itemPlaceholder" runat="server"></td>
          </tr>
        </GroupTemplate>
        <InsertItemTemplate>
          <td runat="server" style="">
            <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" Text='<%# Eval("URL_Imagen_Sucursal") %>' />
            <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
            <br />
          </td>
        </InsertItemTemplate>
        <ItemTemplate>
          <td runat="server" style="">
            <asp:Label ID="lblNameSuc" runat="server" Text='<%# Eval("NombreSucursal") %>' />
            <br />
            <asp:ImageButton ID="imgSuc" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' />
            <br />
            <asp:Label ID="lblDescriptionSuc" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
            <br />
          </td>
        </ItemTemplate>
        <LayoutTemplate>
          <table runat="server">
            <tr runat="server">
              <td runat="server">
                <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                  <tr id="groupPlaceholder" runat="server">
                  </tr>
                </table>
              </td>
            </tr>
            <tr runat="server">
              <td runat="server" style="">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                  <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                  </Fields>
                </asp:DataPager>
              </td>
            </tr>
          </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
          <td runat="server" style="">
            <asp:Label ID="lblNameSuc" runat="server" Text='<%# Eval("NombreSucursal") %>' />
            <br />
            <asp:ImageButton ID="imgSuc" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' />
            <br />
            <asp:Label ID="lblDescriptionSuc" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
            <br />
          </td>
        </SelectedItemTemplate>
      </asp:ListView>
    </div>
  </form>

  <%-- DATA SOURCE --%>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString %>" SelectCommand="SELECT [Id_Sucursal], [NombreSucursal], [DescripcionSucursal], [Id_HorarioSucursal], [Id_ProvinciaSucursal], [DireccionSucursal], [URL_Imagen_Sucursal] FROM [Sucursal]"></asp:SqlDataSource>
</body>
</html>
