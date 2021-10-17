using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class admin_pickupdetail : System.Web.UI.Page
{
    Class1 dc = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!IsPostBack)
            {
                repeatdata();


            }

        }
    }

    private void repeatdata()
    {
        rptpickupdetail.DataSource = dc.getTable("select * from vwpickup");
        rptpickupdetail.DataBind();
    }

    protected void rptbloodbank_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "delete")
        {
            string query = "delete from pickup where pickupid='" + id + "'";
            if (dc.saverecord(query))
            {
                repeatdata();
            }
        }
    }

}