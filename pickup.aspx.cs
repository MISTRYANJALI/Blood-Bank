using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class donor_pickup : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {

         ddcity.DataSource = c1.getTable("select cityid,cityname from city ");
         ddcity.DataMember = "city";
         ddcity.DataTextField = "cityname";
         ddcity.DataValueField = "cityid";
         ddcity.DataBind();

         ddbldgrpid.DataSource = c1.getTable("select bloodgrpid,bloodgrpname from bloodgroup ");
         ddbldgrpid.DataMember = "bloodgroup";
         ddbldgrpid.DataTextField = "bloodgrpname";
         ddbldgrpid.DataValueField = "bloodgrpid";
         ddbldgrpid.DataBind();
    }
    protected void btnsend_Click(object sender, EventArgs e)
    {
        string query = "";
        int id=Convert.ToInt32(Session["regid"]);


        query = "insert into pickup(pickupdate,regid,address,cityid,landmark,bloodgrpid,qty,pickuptime,status) values('" + txtdate.Text + "','" + id + "','" + txtadd.Text + "','" + ddcity.SelectedValue + "','" + txtlandmark.Text + "','" + ddbldgrpid.SelectedValue + "','" + txtqty.Text + "','" + txttime.Text + "','no' )";
        if (c1.saverecord(query))
        {
            Response.Redirect("donoruser.aspx");
        }

    }
}