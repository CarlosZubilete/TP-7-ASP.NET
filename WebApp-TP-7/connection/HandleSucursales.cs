using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebApp_TP_7.connection
{
  public class HandleSucursales
  {
    public HandleSucursales() { }

    public DataTable GetDataTable(string nombreTabla, string querySql)
    {

      DataAccess dataAccess = new DataAccess();
      using (SqlDataAdapter adapter = dataAccess.GetAdapter(querySql))
      {
        if (adapter == null)
          throw new Exception("Error when we can get DATA.");

        DataSet dataSet = new DataSet();
        adapter.Fill(dataSet, nombreTabla);
        return dataSet.Tables[nombreTabla];
      }
    }
  }
}

//public DataTable GetDataQuery(string table,string query)
//{
//  return GetDataTable(table, query); 
//}
/*
DataAccess dataAccess = new DataAccess();
DataSet dataSet = new DataSet();
SqlDataAdapter dataAdapter = dataAccess.GetAdapter(querySql);
dataAdapter.Fill(dataSet, nombreTabla);
return dataSet.Tables[nombreTabla];
*/