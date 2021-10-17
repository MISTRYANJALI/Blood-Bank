using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class receiver_food : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    DataRow rw;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            rptfooddata();
        }

    }

    private void rptfooddata()
    {
        Repfoodimg.DataSource = c1.getTable("select foodimg,description from food");
        Repfoodimg.DataBind();

    }
}