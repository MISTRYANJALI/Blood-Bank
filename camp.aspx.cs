using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_camp : System.Web.UI.Page
{
    Class1 dc = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            repeatdata();
            ddcityname.DataSource = dc.getTable("select cityid,cityname from city");
            ddcityname.DataMember = "city";
            ddcityname.DataTextField = "cityname";
            ddcityname.DataValueField = "cityid";
            ddcityname.DataBind();
        }
    }

    private void repeatdata()
    {
        rptcamp.DataSource = dc.getTable("select * from vwcamp");
        rptcamp.DataBind();
    }

    protected void rptcamp_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "delete")
        {
            string query = "delete from camp where campid='" + id + "'";
            if (dc.saverecord(query))
            {
                repeatdata();
            }
        }

        if (e.CommandName == "update")
        {
            Session["campid"] = id;
            Session["trans"] = "update";
            lbltitle.Text = "Record Update";
            string query = "select * from camp where campid='" + id + "'";
            DataRow rw = dc.getrow(query);
            showdata(rw);
            pnlshow.Visible = false;
            pnlform.Visible = true;
        }

    }


    private void showdata(DataRow rw)
    {
       
        txtcmpdate.Text = rw["campdate"].ToString();
        txtcmpname.Text = rw["campname"].ToString();
        txtloc.Text = rw["location"].ToString();
        ddcityname.SelectedValue = rw["cityname"].ToString();
        txtorg.Text = rw["organizer"].ToString();
        txttime.Text = rw["time"].ToString();
        txtpurpo.Text = rw["purpose"].ToString();
        txtdon.Text = rw["donateby"].ToString();
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        
       
        string query = "";
        if (Session["trans"] == "update")
        {
            int id = Convert.ToInt32(Session["campid"]);
            query = "update camp set campdate='" + txtcmpdate.Text + "',campname='" + txtcmpname.Text + "',location='" + txtloc.Text + "',cityname='" +ddcityname.SelectedValue + "',organizer='" + txtorg.Text + "',time='" + txttime.Text + "',purpose='" + txtpurpo.Text + "',donateby='" + txtdon.Text + "'  where campid='" + id + "'";
        }

        if (Session["trans"] == "new")
        {
            query = "insert into camp(campdate,campname,location,cityname,organizer,time,purpose,donateby) values('" + txtcmpdate.Text + "','" + txtcmpname.Text + "','" + txtloc.Text + "','" + ddcityname.SelectedValue + "','" + txtorg.Text + "','" + txttime.Text + "','" + txtpurpo.Text + "','" + txtdon.Text + "')";
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
        txtcmpdate.Focus();
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Session["trans"] = "";
        Session["campid"] = "";
        lbltitle.Text = "";
        pnlform.Visible = false;
        pnlshow.Visible = true;
        clearall();
    }

    private void clearall()
    {
       
        txtcmpdate.Text = "";
        txtcmpname.Text = "";
        txtloc.Text = "";
        ddcityname.ClearSelection();
        txtorg.Text = "";
        txttime.Text = "";
        txtpurpo.Text = "";
        txtdon.Text = "";
    }
}