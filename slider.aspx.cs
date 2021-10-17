using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_slider : System.Web.UI.Page
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
        rptslider.DataSource = dc.getTable("select * from slider");
        rptslider.DataBind();
    }

    protected void rptslider_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "delete")
        {
            string query = "delete from slider where sliderid='" + id + "'";
            if (dc.saverecord(query))
            {
                repeatdata();
            }
        }

        if (e.CommandName == "update")
        {
            Session["sliderid"] = id;
            Session["trans"] = "update";
            lbltitle.Text = "Record Update";
            string query = "select * from slider where sliderid='" + id + "'";
            DataRow rw = dc.getrow(query);
            showdata(rw);
            pnlshow.Visible = false;
            pnlform.Visible = true;
        }

    }


    private void showdata(DataRow rw)
    {
       
        txtsldname.Text = rw["slidername"].ToString();
        txtfilename.Text = rw["filename"].ToString();
        txtfiletype.Text = rw["filetype"].ToString();
        txttext.Text = rw["text"].ToString();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string query = "";
        if (Session["trans"] == "update")
        {
            int id = Convert.ToInt32(Session["sliderid"]);
            query = "update slider set slidername='" + txtsldname.Text + "',filename='" + txtfilename.Text + "',filetype='" + txtfiletype.Text + "',text='" + txttext.Text + "' where sliderid='" + id + "'";
        }

        if (Session["trans"] == "new")
        {
            query = "insert into slider(slidername,filename,filetype,text) values('" + txtsldname.Text + "','" + txtfilename.Text + "','" + txtfiletype.Text + "','" + txttext.Text + "')";
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
        txtsldname.Focus();
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Session["trans"] = "";
        Session["sliderid"] = "";
        lbltitle.Text = "";
        pnlform.Visible = false;
        pnlshow.Visible = true;
        clearall();
    }

    private void clearall()
    {
       
        txtsldname.Text = "";
        txtfilename.Text = "";
        txtfiletype.Text = "";
        txttext.Text = "";
    }
}