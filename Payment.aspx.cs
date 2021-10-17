using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class receiver_Paymnet : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    string query = "";
    int amt = 900;
     
    int total;

    protected void Page_Load(object sender, EventArgs e)
    {
       

        txtreguser.Text = Session["username"].ToString();
        txtqty.Text = Session["qty"].ToString();
        int qty = Convert.ToInt32(txtqty.Text);
        int regid = Convert.ToInt32(Session["regid"]);
        string query="select emailid from profile where regid='"+ regid +"'";
        string email = c1.getString(query);
        Session["email"] = email;
        total = amt * qty;
        Session["amount"] = total;
        
        txtamount.Text = total.ToString();
    }


    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        
        int reqid = Convert.ToInt32(Session["reqid"]);
        string paydate = DateTime.Today.ToString("MM/dd/yyyy");

        query = "insert into payment(paydate,reqid,amount) values('" + paydate + "','" + reqid + "','" + txtamount.Text + "')";
        Response.Redirect("~/receiver/payment/PayuTransaction.aspx");
    }
}