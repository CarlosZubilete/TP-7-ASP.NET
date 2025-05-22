<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApp_TP_7.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>TP-N°7</title>
  <link href="index.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <%-- Nav --%>
  <div class="navBar">
    <ul class="navBar__ul">
      <%-- LISTADO --%>
      <li class="navBar__ul__li">
        <asp:HyperLink ID="linkIndex" runat="server" NavigateUrl="" CssClass="navBar__link active">
         Listado        
        </asp:HyperLink>
      </li>
      <%-- SELECCIONADOS --%>
      <li class="navBar__ul__li">
        <asp:HyperLink ID="linkListSuc" runat="server" NavigateUrl="" CssClass="navBar__link">
         Seleccionadas
        </asp:HyperLink>
      </li>
    </ul>
  </div>
  <%-- TITLE --%>
  <h1 class="title">Listado de Sucursales </h1>
  <form id="form1" runat="server">
    <%-- MAIN CONTAINER --%>
    <div class="containerMain">

      <%-- LIST PROVINCIES SUCURSALES  --%>
      <div class="listProvincies">
        <asp:DataList ID="dataListProvincies" runat="server" >
          <ItemTemplate>
            <asp:Button runat="server" ID="btnProvincies"
              Text='<%# Eval("DescripcionProvincia") %>' CssClass="btnProvincies" />
          </ItemTemplate>
        </asp:DataList>
      </div>

      <%-- LIST SUCURSALES --%>
      <div class="listStore">
        <%-- LIST VIEW --%>
        <asp:ListView ID="listViewSucursales" runat="server" GroupItemCount="3" DataKeyNames="Id_Sucursal">
          <EditItemTemplate>
            <td runat="server" style="" class="listStore__card">
              <asp:Label ID="lblNameSuc" runat="server" Text='<%# Eval("NombreSucursal") %>' CssClass="listStore__card__name" />
              <br />
              <asp:ImageButton ID="imgSuc" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' CssClass="listStore__card__img" />
              <br />
              <asp:Label ID="lblDescriptionSuc" runat="server" Text='<%# Eval("DescripcionSucursal") %>' CssClass="listStore__card__description" />
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
            <td runat="server" style="" class="listStore__card">
              <asp:Label ID="lblNameSuc" runat="server" Text='<%# Eval("NombreSucursal") %>' CssClass="listStore__card__name" />
              <br />
              <asp:ImageButton ID="imgSuc" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' CssClass="listStore__card__img" />
              <br />
              <asp:Label ID="lblDescriptionSuc" runat="server" Text='<%# Eval("DescripcionSucursal") %>' CssClass="listStore__card__description" />
            </td>
          </InsertItemTemplate>
          <ItemTemplate>
            <td runat="server" style="" class="listStore__card">
              <asp:Label ID="lblNameSuc" runat="server" Text='<%# Eval("NombreSucursal") %>' CssClass="listStore__card__name" />
              <br />
              <asp:ImageButton ID="imgSuc" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' CssClass="listStore__card__img" />
              <br />
              <asp:Label ID="lblDescriptionSuc" runat="server" Text='<%# Eval("DescripcionSucursal") %>' CssClass="listStore__card__description" />
            </td>
          </ItemTemplate>
          <LayoutTemplate>
            <table runat="server">
              <%-- First TR --%>
              <tr runat="server">
                <td runat="server">
                  <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                    <tr id="groupPlaceholder" runat="server">
                    </tr>
                  </table>
                </td>
              </tr>
              <%-- Second TR --%>
              <tr runat="server">
                <td runat="server" style="" class="pagination">
                  <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                    <Fields>
                      <%-- BUTTON NUMERIC --%>
                      <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="pagination__btn" />
                      <asp:NumericPagerField />
                      <%-- BUTTON NEXT PAGE --%>
                      <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"
                        ButtonCssClass="pagination__btn" />
                    </Fields>
                  </asp:DataPager>
                </td>
              </tr>
            </table>
          </LayoutTemplate>
          <SelectedItemTemplate>
            <td runat="server" style="" class="listStore__card">
              <asp:Label ID="lblNameSuc" runat="server" Text='<%# Eval("NombreSucursal") %>' CssClass="listStore__card__name" />
              <br />
              <asp:ImageButton ID="imgSuc" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' CssClass="listStore__card__img" />
              <br />
              <asp:Label ID="lblDescriptionSuc" runat="server" Text='<%# Eval("DescripcionSucursal") %>' CssClass="listStore__card__description" />
            </td>
          </SelectedItemTemplate>
        </asp:ListView>
      </div>
    </div>
  </form>

  <%-- DATA SOURCE --%>
  <%--<asp:SqlDataSource ID="sqlSource_DBSucursales" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString %>"
    SelectCommand="SELECT 
	    SUC.[Id_Sucursal], 
	    SUC.[NombreSucursal], 
	    SUC.[DescripcionSucursal], 
	    SUC.[Id_HorarioSucursal], 
	    SUC.[Id_ProvinciaSucursal], 
	    SUC.[DireccionSucursal], 
	    Pro.[DescripcionProvincia],
	    SUC.[URL_Imagen_Sucursal] 
      FROM [Sucursal] Suc JOIN [Provincia] Pro 
      ON SUC.Id_ProvinciaSucursal = PRO.Id_Provincia"></asp:SqlDataSource>--%>
</body>
</html>

