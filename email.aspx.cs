using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_email : System.Web.UI.Page
{
    Class1 dc = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            repeatdata();
        }
    }

    private void repeatdata()
    {
        rptemail.DataSource = dc.getTable("select * from email");
        rptemail.DataBind();
    }

    protected void rptemail_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "delete")
        {
            string query = "delete from email where emailid='" + id + "'";
            if (dc.saverecord(query))
            {
                repeatdata();
            }
        }

        if (e.CommandName == "update")
        {
            Session["emailid"] = id;
            Session["trans"] = "update";
            lbltitle.Text = "Record Update";
            string query = "select * from email where emailid='" + id + "'";
            DataRow rw = dc.getrow(query);
            showdata(rw);
            pnlshow.Visible = false;
            pnlform.Visible = true;
        }

    }


    private void showdata(DataRow rw)
    {
       
       
        txtemailfrom.Text = rw["emailfrom"].ToString();
        txtemailto.Text = rw["emailto"].ToString();
        txtsub.Text = rw["subject"].ToString();
        txtdescr.Text = rw["description"].ToString();
        txtregid.Text = rw["regid"].ToString();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string emaildate = DateTime.Today.ToString("MM/dd/yyyy");
        string query = "";
        if (Session["trans"] == "update")
        {
            int id = Convert.ToInt32(Session["emailid"]);
            query = "update email set emaildate='" + emaildate + "',emailfrom='" + txtemailfrom.Text + "',emailto='" + txtemailto.Text + "',subject='" + txtsub.Text + "',description='" + txtdescr.Text + "',regid='" + txtregid.Text + "'  where emailid='" + id + "'";
        }

        if (Session["trans"] == "new")
        {
            query = "insert into email(emaildate,emailfrom,emailto,subject,description,regid) values('" + emaildate + "','" + txtemailfrom.Text + "','" + txtemailto.Text + "','" + txtsub.Text + "','" + txtdescr.Text + "','" + txtregid.Text + "' )";
        }

        if (dc.saverecord(query))
        {
            repeatdata();
            pnlform.Visible = false;
            pnlshow.Visible = true;
            clearall();
        }
    }
    protected void btnnew_Click(object sender, EventArgs e)
    {
        Session["trans"] = "new";
        pnlshow.Visible = false;
        pnlform.Visible = true;
        lbltitle.Text = "Record Insert";
        txtemailfrom.Focus();
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Session["trans"] = "";
        Session["emailid"] = "";
        lbltitle.Text = "";
        pnlform.Visible = false;
        pnlshow.Visible = true;
        clearall();
    }

    private void clearall()
    {
        
        
        txtemailfrom.Text = "";
        txtemailto.Text = "";
        txtsub.Text = "";
        txtdescr.Text = "";
        txtregid.Text = "";
    }

}