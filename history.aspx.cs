using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class donor_history : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            repeatdata();
     

        }
    }

    private void repeatdata()
    {
        int id = Convert.ToInt32(Session["regid"]);
        rptblooddonor.DataSource = c1.getTable("select * from vwbdonor where regid='" + id +"' order by regid desc");
        rptblooddonor.DataBind();
    }

    protected void rptblooddonor_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        Session["id"] = id;
       

    }


  

}