using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp_TP_7.connection;

namespace WebApp_TP_7
{
  public partial class index : System.Web.UI.Page
  {
    // Query ListView.
    private const string queryListView = "SELECT [Id_Sucursal],[NombreSucursal],[DescripcionSucursal],[URL_Imagen_Sucursal] FROM [Sucursal]";
    // private const string tableLisView = "Sucursal";
    private const string queryDataList = "SELECT Id_Provincia ,DescripcionProvincia FROM Provincia";
    private HandleSucursales sucursales = new HandleSucursales();
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        this.Load_ListView();
        this.Load_DataList();
      }
    }
    private void Load_ListView()
    {
      listViewSucursales.DataSource = sucursales.GetDataTable("Sucursal", queryListView);
      listViewSucursales.DataBind();
    }
    private void Load_DataList()
    {
      dataListProvincies.DataSource = sucursales.GetDataTable("Provicias", queryDataList);
      dataListProvincies.DataBind();
    }
  }
}