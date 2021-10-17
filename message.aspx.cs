using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class admin_message : System.Web.UI.Page
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
        rptmsg.DataSource = dc.getTable("select * from message");
        rptmsg.DataBind();
    }

    protected void rptmsg_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "delete")
        {
            string query = "delete from message where msgid='" + id + "'";
            if (dc.saverecord(query))
            {
                repeatdata();
            }
        }

        if (e.CommandName == "update")
        {
            Session["msgid"] = id;
            Session["trans"] = "update";
            lbltitle.Text = "Record Update";
            string query = "select * from message where msgid='" + id + "'";
            DataRow rw = dc.getrow(query);
            showdata(rw);
            pnlshow.Visible = false;
            pnlform.Visible = true;
        }

    }


    private void showdata(DataRow rw)
    {
        
       
        txtmsg.Text = rw["message"].ToString();
        txtconno.Text = rw["contactno"].ToString();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string msgdate = DateTime.Today.ToString("MM/dd/yyyy");
        string query = "";
        if (Session["trans"] == "update")
        {
            int id = Convert.ToInt32(Session["msgid"]);
            query = "update message set msgdate='" + msgdate + "',message'" + txtmsg.Text + "',contactno='" + txtconno.Text + "'  where msgid='" + id + "'";
        }

        if (Session["trans"] == "new")
        {
            query = "insert into message(msgdate,message,contactno) values('" +msgdate + "','" + txtmsg.Text + "','" + txtconno.Text + "' )";
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
        txtmsg.Focus();
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Session["trans"] = "";
        Session["msgid"] = "";
        lbltitle.Text = "";
        pnlform.Visible = false;
        pnlshow.Visible = true;
        clearall();
    }

    private void clearall()
    {
       
       
        txtmsg.Text = "";
        txtconno.Text = "";
    }



}