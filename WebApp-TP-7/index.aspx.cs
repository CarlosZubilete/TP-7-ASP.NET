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
    private void Load_ListView(string filterQuery = null)
    {
      // ?? -> operador funsión nula. 
      string query = filterQuery ?? queryListView; 
      listViewSucursales.DataSource = sucursales.GetDataTable("Sucursal", query);
      listViewSucursales.DataBind();
    }
    private void Load_DataList()
    {
      dataListProvincies.DataSource = sucursales.GetDataTable("Provicias", queryDataList);
      dataListProvincies.DataBind();
    }

    protected void btnProvincies_Command(object sender, CommandEventArgs e)
    {

      string filterQuery = queryListView; 
      string queryIdProvincie = "WHERE Id_ProvinciaSucursal  = ";

      if (e.CommandName == "eventoLookupProvincies")
      {
        queryIdProvincie += e.CommandArgument.ToString();
        //lblProvicie.Text = e.CommandArgument.ToString();
        filterQuery += queryIdProvincie; 
        //lblProvicie.Text = filterQuery;
        this.Load_ListView(filterQuery);
      }
    }

    protected void listViewSucursales_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
      DataPager pager = (DataPager)listViewSucursales.FindControl("DataPager1");
      if (pager != null)
      {
        pager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
      }

      this.Load_ListView();
    }

    protected void btnSucursales_Click(object sender, EventArgs e)
    {
      string filterQuery = queryListView + "Where NombreSucursal Like " ;
      string like; 
      if (txtSucursales.Text.Trim().Length > 0)
      {
        like = txtSucursales.Text.ToString();
        filterQuery += $"'%{like}%'";
        lblMessage.Text = filterQuery; 
        this.Load_ListView(filterQuery);
      }
      else
      {
        this.Load_ListView();
        lblMessage.Text = string.Empty;
      }
    }
  }
}


// TODO: THERE IS A PROBLEM WHEN I FILTERED , IT'S OK, but
// TODO: when I was changging the page , the filter was not working