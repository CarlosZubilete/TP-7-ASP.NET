using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebApp_TP_7.connection
{
  public class DataAccess
  {
    private const string _connectingString = @"Data Source=DESKTOP-LFTFVP5\SQLEXPRESS;Initial Catalog=BDSucursales;Integrated Security=True";
    
    public DataAccess() { }
    public SqlConnection GetConnection()
    {
      SqlConnection connection = new SqlConnection(_connectingString);
      try
      {
        connection.Open();
        return connection;
      }
      catch 
      {
        return null;
      }
    }
    public SqlDataAdapter GetAdapter(string querySql)
    {
      SqlDataAdapter dataAdapter;
      try
      {
        dataAdapter = new SqlDataAdapter(querySql, GetConnection());
        return dataAdapter;
      }
      catch 
      {
        return null;
      }
    }
    // execute le procedimiento alamcenado , retorna un entero 
    //public int ExecuteNoQuery(SqlCommand command, string querySql)
    //{
    //  using (SqlConnection _connection = GetConnection())
    //  {
    //    using (SqlCommand _commad = command)
    //    {
    //      _commad.Connection = _connection;
    //      _commad.CommandType = CommandType.StoredProcedure;
    //      _commad.CommandText = querySql;
    //      return _commad.ExecuteNonQuery();
    //    }
    //  }
    //}
  }
}