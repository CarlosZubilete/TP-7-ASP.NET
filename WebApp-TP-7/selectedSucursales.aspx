<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selectedSucursales.aspx.cs" Inherits="WebApp_TP_7.selectedSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
  <link href="selectedSuc.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <%-- Nav --%>
  <div class="navBar">
    <ul class="navBar__ul">
      <%-- LISTADO --%>
      <li class="navBar__ul__li">
        <asp:HyperLink ID="linkIndex" runat="server" NavigateUrl="~/index.aspx" CssClass="navBar__link ">
         Listado        
        </asp:HyperLink>
      </li>
      <%-- SELECCIONADOS --%>
      <li class="navBar__ul__li">
        <asp:HyperLink ID="linkListSuc" runat="server" NavigateUrl="" CssClass="navBar__link active">
         Seleccionadas
        </asp:HyperLink>
      </li>
    </ul>
  </div>

  <h1 class="title">Sucurslaes Seleccionados por el usuario:</h1>
  <form id="form1" runat="server">
    <div>
      <asp:GridView ID="gridShowSuc" runat="server" CssClass="grid-view">
      </asp:GridView>
    </div>
  </form>
</body>
</html>
