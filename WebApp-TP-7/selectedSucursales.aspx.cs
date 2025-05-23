using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApp_TP_7
{
  public partial class selectedSucursales : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        if (Session["TableSucursales"] != null)
        {
          gridShowSuc.DataSource = (DataTable)Session["TableSucursales"];
          gridShowSuc.DataBind();
        }
      }
    }
  }
}