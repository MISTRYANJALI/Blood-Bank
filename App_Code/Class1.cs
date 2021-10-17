using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;



public class Class1
{

    SqlConnection conn = new SqlConnection();

    public Class1()
    {
        conn.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\blooddata.mdf;Integrated Security=True;User Instance=True";
    }

    public DataTable getTable(string query)
    {
        conn.Open();
        DataTable tb = new DataTable();
        try
        {
            SqlDataAdapter sda=new SqlDataAdapter(query,conn);
            DataSet ds=new DataSet();
            sda.Fill(ds);
            tb=ds.Tables[0];
            
        }
        catch(SqlException ex)
        {
            tb=null;
            Console.Write(ex.Message);
        }
         catch(Exception ex)
        {
            tb=null;
            Console.Write(ex.Message);
        }

        finally
        {
            conn.Close();
        }
        return tb;
    }

     public SqlDataReader getrecord(string query)
    {
        conn.Open();
       SqlDataReader sdr;
        try{
           SqlCommand cmd=new SqlCommand(query,conn);
            sdr=cmd.ExecuteReader();
            sdr.Read();
       }
        catch(SqlException ex)
        {
            sdr=null;
            Console.Write(ex.Message);
        }
         catch(Exception ex)
        {
            sdr=null;
            Console.Write(ex.Message);
        }

        finally{
            conn.Close();
        }
        return sdr;
    }

     public DataRow getrow(string query)
     {
         conn.Open();
         DataRow rw;
         try
         {
             SqlDataAdapter sda = new SqlDataAdapter(query, conn);
             DataSet ds = new DataSet();
             DataTable tb = new DataTable();
             sda.Fill(ds);
             tb = ds.Tables[0];
             rw = tb.Rows[0];

         }
         catch (SqlException ex)
         {
             rw = null;
             Console.Write(ex.Message);
         }
         catch (Exception ex)
         {
             rw = null;
             Console.Write(ex.Message);
         }

         finally
         {
             conn.Close();
         }
         return rw;
     }
     public bool saverecord(string query)
     {
         bool result;
         conn.Open();
         try
         {
             SqlCommand cmd = new SqlCommand(query, conn);
             cmd.ExecuteNonQuery();
             result = true;
         }
         catch (Exception ex)
         {
             result = false;
         }
         finally
         {
             conn.Close();
         }
         return result;
     }


     public int primarykey(string query)
     {
         conn.Open();
         int pk = 0;
         SqlDataReader sdr=null;
         try
         {
             SqlCommand cmd = new  SqlCommand(query, conn);
            
             sdr = cmd.ExecuteReader();
             sdr.Read();
             pk =Convert.ToInt32(sdr[0]);
             pk++;
            }
         catch (SqlException ex)
         {
             pk = 1;
             Console.Write(ex.Message);
         }
         catch (Exception ex)
         {
            Console.Write(ex.Message);
         }

         finally
         {
             sdr.Close();
             conn.Close();
         }
         return pk;
     }

     public string getString(string query)
     {
         conn.Open();
         string str="";
         SqlDataReader sdr = null;
         try
         {
             SqlCommand cmd = new SqlCommand(query, conn);

             sdr = cmd.ExecuteReader();
             sdr.Read();
             str = Convert.ToString(sdr[0]);
             
         }
         catch (SqlException ex)
         {
             str = "";
             Console.Write(ex.Message);
         }
         catch (Exception ex)
         {
             Console.Write(ex.Message);
         }

         finally
         {
             sdr.Close();
             conn.Close();
         }
         return str;
     }

    
}