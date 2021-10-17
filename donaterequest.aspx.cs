using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class donor_donaterequest : System.Web.UI.Page
{
    Class1 c1 = new Class1(); 
    protected void Page_Load(object sender, EventArgs e)
    {

        ddbldgrpid.DataSource = c1.getTable("select bloodgrpid,bloodgrpname from bloodgroup ");
        ddbldgrpid.DataMember = "bloodgroup";
        ddbldgrpid.DataTextField = "bloodgrpname";
        ddbldgrpid.DataValueField = "bloodgrpid";
        ddbldgrpid.DataBind();
        


    }


    protected void btnsave_Click(object sender, EventArgs e)
    {
        string query = "";

         int id = Convert.ToInt32(Session["regid"]);
         string reqdate = DateTime.Today.ToString("MM/dd/yyyy");


        query="insert into donaterequest(reqdate,regid,bloodgrpid,qty,unit,remark) values('" +reqdate+"','"+id+"','" +ddbldgrpid.SelectedValue+"','"+txtqty.Text+"','"+ txtunit.Text +"','" +txtremark+"')";
        if (c1.saverecord(query))
        {
            Response.Redirect("donoruser.aspx");
        }



    }
}