using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_adminmaster : System.Web.UI.MasterPage
{

    protected void logout_Click(object sender, EventArgs e)
    {
        Session["regid"] = "";
        Session["username"] = "";
       lblname.Text = Session["username"].ToString();
        Response.Redirect("../main/mainhome.aspx");
    }
}
