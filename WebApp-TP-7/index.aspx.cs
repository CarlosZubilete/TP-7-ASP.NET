using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp_TP_7.connection;
using System.Data;

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

    protected void btnSelectSuc_Command(object sender, CommandEventArgs e)
    {
      string idSuc;
      string nameSuc;
      string descriptiondSuc;
      // string args;
      if(e.CommandName == "enventoSelectProvincie")
      {
        // how identify eeach Eval
        nameSuc = e.CommandArgument.ToString().Split('|')[0];
        descriptiondSuc = e.CommandArgument.ToString().Split('|')[1];
        idSuc = e.CommandArgument.ToString().Split('|')[2];

        if(Session["TableSucursales"] == null)
        {
          Session["TableSucursales"] = this.CreateTable();
        }
        
        DataRow row = this.GetExistingRow((DataTable)Session["TableSucursales"], idSuc);

        if (row != null)
        {
          row["Selecionado"] = (int)row["Selecionado"] + 1;
        }
        else
        {
          this.AddRegister((DataTable)Session["TableSucursales"], idSuc , nameSuc,descriptiondSuc,1);
        }
      }

    }

    private DataTable CreateTable()
    {
      // Create a Object Table
      DataTable table = new DataTable();
      // Create a Object Column
      DataColumn column = new DataColumn("Id_Sucursal", typeof(int));
      // Add column to table
      table.Columns.Add(column);

      table.Columns.Add(new DataColumn("NombreSucursal", System.Type.GetType("System.String")));
      table.Columns.Add(new DataColumn("DescripcionSucursal",typeof(string)));
      table.Columns.Add(new DataColumn("Selecionado", typeof(int)));

      return table;
    }

    private DataTable AddRegister(DataTable dataTable, string idSuc , string nameSuc , string descriptionSuc, int selected)
    {
      DataRow row = dataTable.NewRow();
      row["Id_Sucursal"] = idSuc;
      row["NombreSucursal"] = nameSuc;
      row["DescripcionSucursal"] = descriptionSuc;
      row["Selecionado"] = selected;

      dataTable.Rows.Add(row);

      return dataTable;
    }
    private DataRow GetExistingRow(DataTable table, string idSuc)
    {
      foreach (DataRow row in table.Rows)
      {
        if (row["Id_Sucursal"].ToString() == idSuc)
        {
          return row;
        }
      }
      return null;
    }
  }
}


// TODO: THERE IS A PROBLEM WHEN I FILTERED , IT'S OK, but  when I was changging the page , the filter was not working
// TODO: Create a file.js for that when I pressed the button , don't load the page.