using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_contactus : System.Web.UI.Page
{
    Class1 dc = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            repeadata();
        }

    }
    private void repeadata()
    {
        rptcon.DataSource = dc.getTable("select * from contactus where status='no'");
        rptcon.DataBind();
    }
    protected void rptcon_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        string query = "update contactus set status='yes' where contactid='"+id+"'";
        if (dc.saverecord(query))
        {
            repeadata();
        }
    }
}