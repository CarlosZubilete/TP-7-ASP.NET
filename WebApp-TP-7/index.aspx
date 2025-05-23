<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApp_TP_7.index" UnobtrusiveValidationMode="None" %>

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
        <asp:HyperLink ID="linkListSuc" runat="server" NavigateUrl="~/selectedSucursales.aspx" CssClass="navBar__link">
         Seleccionadas
        </asp:HyperLink>
      </li>
    </ul>
  </div>
  <%-- TITLE --%>
  <h1 class="title">Listado de Sucursales </h1>
  <form id="form1" runat="server">
    <%-- BUSCQUEDA DE SUCURSALES. --%>
    <div class="lookupSucursales">
      <span class="lookupSucursales__texto">Nombre de Sucursal</span>
      <asp:TextBox ID="txtSucursales" runat="server" CssClass="lookupSucursales__input"></asp:TextBox>
      <asp:Button ID="btnSucursales" runat="server" Text="Buscar" CssClass="lookupSucursales__btn" OnClick="btnSucursales_Click" />
      <%-- VALIDADORES --%>
      <asp:RegularExpressionValidator ID="regexOnlyCharacter" runat="server" ControlToValidate="txtSucursales" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
      <%--<asp:Label ID="lblShowError" runat="server" Text=""></asp:Label>--%>
    </div>
    <%-- MENSAJE DE BUSQUEDA --%>
    <div>
      <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    </div>
    <%-- MAIN CONTAINER - DATALIST - LISTVIEW --%>
    <div class="containerMain">
      <%-- LIST PROVINCIES SUCURSALES  --%>
      <div class="listProvincies">
        <asp:DataList ID="dataListProvincies" runat="server">
          <ItemTemplate>
            <asp:Button runat="server" ID="btnProvincies"
              Text='<%# Eval("DescripcionProvincia") %>' CssClass="btnProvincies"
              CommandName="eventoLookupProvincies" CommandArgument='<%# Eval("Id_Provincia") %>' OnCommand="btnProvincies_Command" />
          </ItemTemplate>
        </asp:DataList>

      </div>

      <%-- LIST SUCURSALES --%>
      <div class="listStore">
        <%-- LIST VIEW --%>
        <asp:ListView ID="listViewSucursales" runat="server" GroupItemCount="3" DataKeyNames="Id_Sucursal" OnPagePropertiesChanging="listViewSucursales_PagePropertiesChanging">
          <EditItemTemplate>
            <td runat="server" style="" class="listStore__card">
              <asp:Label ID="lblNameSuc" runat="server" Text='<%# Eval("NombreSucursal") %>' CssClass="listStore__card__name" />
              <br />
              <asp:ImageButton ID="imgSuc" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' CssClass="listStore__card__img" />
              <br />
              <asp:Label ID="lblDescriptionSuc" runat="server" Text='<%# Eval("DescripcionSucursal") %>' CssClass="listStore__card__description" />
              <br />
              <asp:Button ID="btnSelectSuc" runat="server" Text="Seleccionar"
                CssClass="listStore__card__btn"
                CommandArgument='<%# Eval("NombreSucursal") + "|"+ Eval("DescripcionSucursal") + "|"+ Eval("Id_Sucursal") %>' 
                CommandName="enventoSelectProvincie" OnCommand="btnSelectSuc_Command"/>
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
              <br />
              <asp:Button ID="btnSelectSuc" runat="server" Text="Seleccionar"
                CssClass="listStore__card__btn"
                CommandArgument='<%# Eval("NombreSucursal") + "|"+ Eval("DescripcionSucursal") + "|"+ Eval("Id_Sucursal") %>' 
                CommandName="enventoSelectProvincie" OnCommand="btnSelectSuc_Command"/>
            </td>
          </InsertItemTemplate>
          <ItemTemplate>
            <td runat="server" style="" class="listStore__card">
              <asp:Label ID="lblNameSuc" runat="server" Text='<%# Eval("NombreSucursal") %>' CssClass="listStore__card__name" />
              <br />
              <asp:ImageButton ID="imgSuc" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' CssClass="listStore__card__img" />
              <br />
              <asp:Label ID="lblDescriptionSuc" runat="server" Text='<%# Eval("DescripcionSucursal") %>' CssClass="listStore__card__description" />
              <br />
              <asp:Button ID="btnSelectSuc" runat="server" Text="Seleccionar"
                CssClass="listStore__card__btn"
                CommandArgument='<%# Eval("NombreSucursal") + "|"+ Eval("DescripcionSucursal") + "|"+ Eval("Id_Sucursal") %>' 
                CommandName="enventoSelectProvincie" OnCommand="btnSelectSuc_Command"/>
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
              <br />
              <asp:Button ID="btnSelectSuc" runat="server" Text="Seleccionar"
                CssClass="listStore__card__btn"
                CommandArgument='<%# Eval("NombreSucursal") + "|"+ Eval("DescripcionSucursal") + "|"+ Eval("Id_Sucursal") %>' 
                CommandName="enventoSelectProvincie" OnCommand="btnSelectSuc_Command"/>
            </td>
          </SelectedItemTemplate>
        </asp:ListView>
      </div>
    </div>
  </form>

  <%-- DATA SOURCE - SUCURSALES--%>
  <%--<asp:SqlDataSource ID="sqlSource_DBSucursales" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString %>"
    SelectCommand="SELECT 
	    SUC.[Id_Sucursal], 
	    SUC.[NombreSucursal], 
	    SUC.[DescripcionSucursal], 
	    SUC.[URL_Imagen_Sucursal] 
      FROM [Sucursal] Suc JOIN [Provincia] Pro 
      ON SUC.Id_ProvinciaSucursal = PRO.Id_Provincia"></asp:SqlDataSource>--%>

  <br />

  <%-- DATA SOURCE - PROVINCIAS --%>
  <%--<asp:SqlDataSource ID="sqlSource_DBSucursales_Provincies" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString %>"
    SelectCommand="SELECT Id_Provincia ,DescripcionProvincia FROM Provincia"></asp:SqlDataSource>--%>
</body>
</html>

