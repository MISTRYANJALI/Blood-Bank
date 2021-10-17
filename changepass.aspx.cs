using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class admin_changepass : System.Web.UI.Page
{

    Class1 dc = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnchpwd_Click(object sender, EventArgs e)
    {
        int regid = Convert.ToInt32("regid");
        string query = "";
        query = "Select password from register where regid='" + regid + "'";
        DataRow rw = dc.getrow(query);

        if (txtoldpwd.Text.Equals(rw["password"]))
        {
            query = "update register set password='" + txtnewpwd + "' where regid='" + regid + "'";
            if (dc.saverecord(query))
            {
                lblmsg.Text = "Password Update Successfully...";
            }
            else
            {
                lblmsg.Text = "Password Not Change...";
            }
        }
        else
        {
            lblmsg.Text = "Password Does Not Match";
        }
    }

}